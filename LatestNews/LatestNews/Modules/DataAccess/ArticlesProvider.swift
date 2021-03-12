//
//  ArticlesProvider.swift
//  LatestNews
//
//  Created by Sherif Nasr on 12/03/2021.
//

import Foundation
import Alamofire
import Moya

enum ArticlesProvider {
    case viewedArticles(days: Int)
}

extension ArticlesProvider: BaseProvider{
    
    private var articlesApiKey: String {
        return "ab803f4GoV5X7Ae3NyccbF9EHIEz5UCc"
    }

    var path: String {
        switch self {
        case .viewedArticles(let days):
            return "/viewed/\(days).json"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .viewedArticles(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .viewedArticles(_):
            return .requestParameters(parameters: ["api-key" : articlesApiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }

    
}
