//
//  Category.swift
//  ThuVienAnh
//
//  Created by cvcuong on 20/04/2023.
//

import Foundation
import ObjectMapper

class Category: Mappable {
    var id: Int64?
    var name: String?
    var image: String?
    var status: Int?
    
    init (){}
    required init?(map: Map) {
        mapping(map: map)
    }
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        image <- map["image"]
        status <- map["status"]
    }
}
