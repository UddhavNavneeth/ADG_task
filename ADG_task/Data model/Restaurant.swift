//
//  Restaurant.swift
//  ADG_task
//
//  Created by Sarvad shetty on 1/12/18.
//  Copyright © 2018 Sarvad shetty. All rights reserved.
//

import Foundation
class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    var phoneNumber = ""
    init(name:String, type:String, location:String, phoneNumber:String ,image:String, isVisited:Bool  ) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        self.phoneNumber = phoneNumber
        
    }
}
