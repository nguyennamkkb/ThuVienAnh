//
//  PasswordStorage.swift
//  ThuVienAnh
//
//  Created by cvcuong on 19/04/2023.
//

import Foundation
import ObjectMapper

class PasswordStorage: Mappable {
   
    var id: Int64?
    var date: String?
    var title: String?
    var category: String?
    var name: String?
    var pass: String?
    var status: Int?
    var heart: Int?
    init(){
    
    }
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        date <- map["date"]
        category <- map["category"]
        title <- map["title"]
        name <- map["name"]
        pass <- map["pass"]
        status <- map["status"]
        heart <- map["heart"]
    }
}
