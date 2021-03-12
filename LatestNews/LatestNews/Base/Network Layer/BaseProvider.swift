//
//  BaseProvider.swift
//  LatestNews
//
//  Created by Sherif Nasr on 12/03/2021.
//

import Foundation
import Moya

protocol BaseProvider : TargetType{
    
}

extension BaseProvider {
    var baseURL: URL {
        if let url = URL(string: BaseUrl){
            return url
        }
        fatalError("Base url not found")
    }
}
