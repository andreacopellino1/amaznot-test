//
//  Declaration.swift
//  Amaznot
//
//  Created by Andrea Copellino on 17/11/22.
//

import Foundation

struct Product:Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var averageRating: Int
    var description: String
    var currentPrice: Int
    var originalPrice: Int
    var calculatedDiscount: Int
    var availableStock: Int
    var shippingDate: String
    
    
    
//    init(title: String, wasCompleted: Bool) {
//        self.title = title
//        self.wasCompleted = wasCompleted
//    }

//    static var multipleActivitiesTest: [Product] {
//        [
//            Product(title: "Bah", wasCompleted: false),
//            Product(title: "Beh", wasCompleted: false)
//        ]
//    }
    
}
