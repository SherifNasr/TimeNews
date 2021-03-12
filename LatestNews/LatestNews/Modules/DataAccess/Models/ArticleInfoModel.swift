//
//  ArticleInfoModel.swift
//  LatestNews
//
//  Created by Sherif Nasr on 12/03/2021.
//

import Foundation

struct ArticleInfoModel: Codable {
    var id : Int
    var url: String
    var section: String
    var byline: String
    var type: String
    var title: String
    var abstract: String
    var publishedDate: String
    var source: String
    var uri : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case section
        case byline
        case type
        case title
        case abstract
        case publishedDate = "published_date"
        case source
        case uri
    }

}
