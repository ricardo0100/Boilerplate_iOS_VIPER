//
//  Collection.swift
//
//  Created by MARCELO GRACIETTI on 01/12/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import RealmSwift

extension Results {
    
    func toArray () -> [Object] {
        var array = [Object]()
        for result in self {
            array.append(result)
        }
        return array
    }
}
