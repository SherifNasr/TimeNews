//
//  MyError.swift
//  LatestNews
//
//  Created by Sherif Nasr on 12/03/2021.
//

import Foundation

enum MyError: Error {
    case parseError
    case generalError
}

extension MyError {
    public var message: String? {
        switch self {
        case .parseError:
            return "sorry cannot parse object"
        case .generalError:
            return "sorry, we have technical difficulties"
        }
    }
}
