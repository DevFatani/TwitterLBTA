//
//  Service.swift
//  TwitterLBTA
//
//  Created by Muhammad Fatani on 07/02/2019.
//  Copyright © 2019 Muhammad Fatani. All rights reserved.
//

import TRON
import SwiftyJSON
struct Service {
    
    static let sharedInstance = Service()
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON error")
        }
    }
    func fetchHomeFeed(completion:  @escaping (HomeDatasource?, Error?) -> ()) {
        let request: APIRequest<HomeDatasource,JSONError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { homeDatasource in
         completion(homeDatasource, nil)
        }, failure: { error in
       
            completion(nil, error)
        })
        
    }
}
