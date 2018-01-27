//
//  Restaurant.swift
//  ADG_task
//
//  Created by Sarvad shetty on 1/12/18.
//  Copyright © 2018 Sarvad shetty. All rights reserved.
//
//
import Foundation
import RealmSwift

//class Restaurant {
//    var name = ""
//    var type = ""
//    var location = ""
//    var phoneNumber = ""
//    var image = ""
//    var isVisited = false
//    var rating = ""
//
//    init(name:String, type:String, location:String, phoneNumber:String, image:String, isVisited:Bool) {
//        self.name = name
//        self.type = type
//        self.location = location
//        self.phoneNumber = phoneNumber
//        self.image = image
//        self.isVisited = isVisited
//    }
//}

class Restaurant : Object{
    @objc dynamic var name:String = ""
    @objc dynamic var type:String = ""
    @objc dynamic var location:String = ""
    @objc dynamic var phoneNumber:String = ""
    @objc dynamic var image:Data?
    @objc dynamic var isVisited:Bool = false
    @objc dynamic var rating:String = "rating"
}
