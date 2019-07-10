//
//  ViewController.swift
//  Movies
//
//  Created by Laura on 7/7/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sections: [Section] = []
    
    private var hasMorePages = true
    private var isFetchInProgress = false
    private var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSections()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: FiltersTableViewCell.getIdentifier(), bundle: nil), forCellReuseIdentifier: FiltersTableViewCell.getIdentifier())
        tableView.register(UINib(nibName: MoviesTableViewCell.getIdentifier(), bundle: nil), forCellReuseIdentifier: MoviesTableViewCell.getIdentifier())
    }
    
    private func setupSections() {
        sections.append(FiltersSection(filters: Constant.filters))
        createMoviesSection()
    }
    
    private func createMoviesSection() {
        NetworkRequest().sharedInstance?.fetchUpcomingMovies(for: 1, "en-US", success: { [weak self] (movies) in
            guard let self = self else { return }
            self.sections.append(MoviesSection(movies: movies))
            self.setupTableView()
            }, failure: { (error) in
                print(error.localizedDescription)
        })
    }
    
    private func loadMoreMovies(for page: Int) {
        NetworkRequest().sharedInstance?.fetchUpcomingMovies(for: page, "en-US", success: { [weak self] (movies) in
            guard let self = self else { return }
            if var moviesSection = self.sections[1] as? MoviesSection {
                moviesSection.appendMovies(movies: movies)
                self.sections[1] = moviesSection
                self.tableView.reloadData()
            }
            }, failure: { (error) in
                print(error.localizedDescription)
        })
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        var cellIdentifier = ""
        
        switch sections[indexPath.section].type {
        case .filters:
            cellIdentifier = FiltersTableViewCell.getIdentifier()
        case .movies:
            cellIdentifier = MoviesTableViewCell.getIdentifier()
        }
        
        if let newCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BaseTableViewCell {
            newCell.configureCell(with: sections[indexPath.section])
            cell = newCell
        }
        
        return cell ?? UITableViewCell(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].height
    }
}
