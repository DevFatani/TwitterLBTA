//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by Muhammad Fatani on 26/01/2019.
//  Copyright © 2019 Muhammad Fatani. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map{ try T(json: $0)}
    }
}


class HomeDatasource: Datasource, JSONDecodable {
    let users: [User]
    let tweets:[Tweet]
    required init(json: JSON) throws {
        guard
            let usersJsonArray = json["users"].array,
        let tweetsJsonArray = json["tweets"].array else {
            throw NSError(
                domain: "com.devfatani",
                code: 404, userInfo:
                [NSLocalizedDescriptionKey: "parsing JSON was not valid"]
            )
        }
        
        self.users = try usersJsonArray.decode()
        self.tweets = try tweetsJsonArray.decode()
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
}
