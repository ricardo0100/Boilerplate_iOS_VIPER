//
//  UserProfile.swift
//
//
//  Created by MARCELO GRACIETTI on 12/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class UserProfile: Object, Mappable {
    
    dynamic var name: String?
    dynamic var email: String?
    dynamic var token: String?
    dynamic var password: String?
       
    convenience required init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "email"
    }
    
    // MARK: Error fields
    
    var errors: ResponseErrors?
    
    // MARK: Mappable protocol
    
    func mapping(map: Map) {
        name <- map["name"]
        email <- map["email"]
        token <- map["token"]
        password <- map["password"]
        errors <- map["errors"]
    }
}
