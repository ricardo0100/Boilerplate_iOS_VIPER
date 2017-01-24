//
//  LoginSingupErrors.swift
//
//  Created by MARCELO GRACIETTI on 09/12/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import Foundation
import ObjectMapper


class ResponseErrors: Mappable {
    
    var emailTakenOrInvalid: [String]?
    var passwordIssue: [String]?
    var userIsInvalid: [String]?
    
    required convenience init?(map: Map) {
        self.init()
    }

    // Mappable protocol
    
    func mapping(map: Map) {
        emailTakenOrInvalid <- map["email"]
        passwordIssue <- map["password"]
        userIsInvalid <- map["partner_id"]
    }
}
