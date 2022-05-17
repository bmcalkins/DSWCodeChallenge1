//
//  ReportAuthor.swift
//  DSWCodeChallenge
//
//  Created by Bradley Calkins on 5/16/22.
//

import Foundation

struct ReportAuthor {

    static func getReport(productData: ProductParser) -> String {

        var clearanceItems = [ProductUnit]()
        var normalPrice = [ProductUnit]()
        var priceInCart = [ProductUnit]()
        for product in productData.products {
            guard product.isValid else {
                continue
            }
            if product.isClearance {
                clearanceItems.append(product)
            } else {
                normalPrice.append(product)
            }
            if product.isPriceHidden {
                priceInCart.append(product)
            }
        }
        let clearanceReport = Report.createReport(
            name: Price.clearance.rawValue,
            products: clearanceItems)
        let normalReport = Report.createReport(
            name: Price.normal.rawValue,
            products: normalPrice)
        let priceInCartReport = Report.createReport(
            name: Price.cart.rawValue,
            products: priceInCart)
        let reports = [clearanceReport, normalReport, priceInCartReport].sorted { $0.numProducts > $1.numProducts }
        let summary = reports.reduce("") { $0.description + $1.description + "\n" }
        return summary
    }

    enum Price: String {
        case clearance = "Clearance Price"
        case normal = "Normal Price"
        case cart = "Price In Cart"
    }
}

struct Report {

    static func createReport(name: String, products: [ProductUnit]) -> Report {
        var numProducts = 0
        var rangeMin: Float = Float(Int.max)
        var rangeMax: Float = 0
        for product in products {
            if rangeMax < product.price {
                rangeMax = product.price
            }
            if rangeMin > product.price {
                rangeMin = product.price
            }
            numProducts += 1
        }
        let report = Report(name: name, range: (rangeMin, rangeMax), numProducts: numProducts)
        return report
    }

    private var name: String
    private var range: (Float, Float)
    var numProducts: Int

    var description: String {
        var results = "\(name): \(numProducts) products"
        let (rangeMin, rangeMax) = range
        if numProducts > 0 {
            results += " @ $\(rangeMin)"
        }
        if rangeMax > rangeMin {
            results += " - \(rangeMax)"
        }
        return results
    }

}
