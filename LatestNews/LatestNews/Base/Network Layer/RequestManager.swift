//
//  RequestManager.swift
//  LatestNews
//
//  Created by Sherif Nasr on 12/03/2021.
//

import Foundation
import Moya

class RequestManager {
    
    static func beginRequest<C: Codable, T: TargetType>(with target:T,
                                                        responseModel model:C.Type,
                                                        completion handler: @escaping (_ data: Any?, _ error: Error?) -> () ){
        let provider = MoyaProvider<T>()
        provider.request(target) { (result) in
            switch result {
            case let .success(response):
                if response.statusCode != 200 {
                    handler(nil, MyError.generalError) // to be shown to user
                    return
                }
                do {
                    let parsedObject = try response.map(model)
                    handler(parsedObject, nil)
                } catch {
                    handler(nil, MyError.parseError)
                }
                
            case let .failure(error):
                print("error:: \(error)") // to be monitored by dev team
                handler(nil, MyError.generalError) // to be shown to user
            }
        }
    }
    
}
