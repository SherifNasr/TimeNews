//
//  ArticlesListResponse.swift
//  LatestNews
//
//  Created by Sherif Nasr on 12/03/2021.
//

import Foundation

struct ArticlesListResponse: Codable {
    var status: String
    var copyright: String
    var num_results: Int
    var results: [ArticleInfoModel]
}
