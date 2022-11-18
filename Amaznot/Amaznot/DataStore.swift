//
//  DataStore.swift
//  Amaznot
//
//  Created by Andrea Copellino on 17/11/22.
//

import Foundation
class DataStore: ObservableObject {
    @Published var products:[Product] = []

    static var xboxSeriesX: Product {
    Product(title: "Xbox Series X", averageRating: 4, description: "This is a very long description", currentPrice: 499, originalPrice: 549, calculatedDiscount: 9, availableStock: 30, shippingDate: "November 10th")
    }
    
    func pushActivity() {
        products.append(DataStore.xboxSeriesX)
    }
    
    func placeHolderFunc() -> Void {
        print("questa è la placeholder func")
    }
}
