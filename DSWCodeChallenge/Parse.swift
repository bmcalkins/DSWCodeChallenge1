//
//  Parse.swift
//  DSWCodeChallenge
//
//  Created by Bradley Calkins on 5/16/22.
//

import Foundation

class ProductParser {

    var priceSets: [PriceSet] = []
    var products: [ProductUnit] = []

    func parse(document: String) -> String {
        let lines = document.split(separator: "\n")
        for line in lines {
            parse(line: String(line))
        }
        let report = ReportAuthor.getReport(productData: self)
        return report
    }

    func parse(line: String) {
        let values = line.split(separator: ",")
        guard let entryType = values.first else {
            return
        }
        if entryType == "Type" {
            let priceType = PriceSet(input: line)
            priceSets.append(priceType!)
        } else if entryType == "Product" {
            let productItem = ProductUnit(input: line)
            products.append(productItem!)
        }
    }

}
