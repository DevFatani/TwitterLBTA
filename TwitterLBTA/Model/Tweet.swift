//
//  Tweet.swift
//  TwitterLBTA
//
//  Created by Muhammad Fatani on 02/02/2019.
//  Copyright © 2019 Muhammad Fatani. All rights reserved.
//

import SwiftyJSON
import TRON
struct Tweet: JSONDecodable {
    let user:User
    let message:String
    
    init(json: JSON) {
        self.user = User(json: json["user"])
        self.message = json["message"].stringValue
    }
}
