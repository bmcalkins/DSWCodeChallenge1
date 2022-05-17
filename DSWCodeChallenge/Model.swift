//
//  Model.swift
//  DSWCodeChallenge
//
//  Created by Bradley Calkins on 5/16/22.
//

import Foundation

struct PriceSet {

    let key: String
    let name: String
    init?(input: String) {
        let priceValues = input.split(separator: ",")
        guard priceValues.count >= 2 else {
            return nil
    }
        self.key = String(priceValues[1])
        self.name = String(priceValues[2])
    }

}
struct ProductUnit {

    let normalPrice: Float
    let clearancePrice: Float
    let quantity: Int
    let isPriceHidden: Bool
    var isValid: Bool {
        quantity >= 3
    }

    var isClearance: Bool {
        normalPrice > clearancePrice
    }

    var price: Float {
        isClearance ? clearancePrice : normalPrice
    }

    init?(input: String) {
        let productValues = input.split(separator: ",")
            guard productValues.count >= 5 else {
                return nil
            }
        self.normalPrice = productValues[1].toFloat()
        self.clearancePrice = productValues[2].toFloat()
        self.quantity = productValues[3].toInt()
        self.isPriceHidden = productValues[4].toBool()
    }

}
