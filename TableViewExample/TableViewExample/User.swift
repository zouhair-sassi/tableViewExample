//
//  User.swift
//  TableViewExample
//
//  Created by Zouhair Sassi on 6/21/19.
//  Copyright © 2019 Zouhair Sassi. All rights reserved.
//

import Foundation

class User {

    var name: String
    var age: Int
    var sex: String
    var number: Int64

    init(name: String, age: Int, sex: String, number: Int64) {
        self.name = name
        self.age = age
        self.sex = sex
        self.number = number 
    }

}
