//
//  DataResponse.swift
//
//  Created by MARCELO GRACIETTI on 07/12/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import Foundation
import Alamofire


extension DataResponse {
    
    var isSuccess: Bool {
        get {
            guard let statusCode = response?.statusCode else { return false }
            if 200 ... 299 ~= statusCode {
                return true
            } else {
                return false
            }
        }
    }
}
