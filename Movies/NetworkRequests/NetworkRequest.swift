//
//  NetworkRequest.swift
//  Movies
//
//  Created by Laura on 7/8/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import Foundation
import Alamofire

private enum Endpoint: String {
    case upcoming
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
}

struct APIParameters {
    static let apiKey = "api_key"
    static let page = "page"
    static let language = "language"
}

class NetworkRequest {
    private let baseURL = "https://api.themoviedb.org/3/movie/"
    private let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    
    private var _sharedInstance: NetworkRequest?
    var sharedInstance: NetworkRequest? {
        return _sharedInstance ?? NetworkRequest()
    }
    
    func fetchUpcomingMovies(for page: Int, _ language: String, success: @escaping ([Movie], Int) -> (), failure: @escaping (Error) -> ()) {
        fetchMovies(from: Endpoint.upcoming.rawValue, for: page, language, success: success, failure: failure)
    }
    
    func fetchNowPlayingMovies(for page: Int, _ language: String, success: @escaping ([Movie], Int) -> (), failure: @escaping (Error) -> ()) {
        fetchMovies(from: Endpoint.nowPlaying.rawValue, for: page, language, success: success, failure: failure)
    }

    func fetchTopRatedMovies(for page: Int, _ language: String, success: @escaping ([Movie], Int) -> (), failure: @escaping (Error) -> ()) {
        fetchMovies(from: Endpoint.topRated.rawValue, for: page, language, success: success, failure: failure)
    }

    private func fetchMovies(from endpoint: String, for page: Int, _ language: String, success: @escaping ([Movie], Int) -> (), failure: @escaping (Error) -> ()) {
        let url = baseURL + endpoint
        
        let params: [String: Any] = [
            APIParameters.apiKey: apiKey,
            APIParameters.page: page,
            APIParameters.language: language
        ]
        
        AF.request(url, method: .get, parameters: params).responseDecodable { (response: DataResponse<MovieList>) in
            switch response.result {
            case .success(let movies):
                success(movies.movies, movies.totalPages)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func fetchMovie(with id: Int, success: @escaping (Movie) -> (), failure: @escaping (Error) -> ()) {
//        let params = [
//            "api_key": "a07e22bc18f5cb106bfe4cc1f83ad8ed"
//        ]
//
//        AF.request(url, method: .get, parameters: params, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>)
    }
}
