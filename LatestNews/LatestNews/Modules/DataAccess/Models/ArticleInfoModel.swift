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
    var publishedDate: String
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case title
        case publishedDate = "published_date"
    }

}
