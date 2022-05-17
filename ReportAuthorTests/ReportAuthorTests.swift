//
//  ReportAuthorTests.swift
//  ReportAuthorTests
//
//  Created by Bradley Calkins on 5/16/22.
//

import XCTest

class ReportAuthorTests: XCTestCase {

    var sut = Report.createReport(name: "Clearance", products: [ProductItem(input: "Product,79.99,49.98,5,false")!])

    func testCreateReportNumProducts() {
        let expected = 1
        let result = sut.numProducts
        XCTAssertEqual(expected, result)
    }

    func testCreateReportDescriptionOneProduct() {
        let expected = "Clearance: 1 products @ $49.98"
        let result = sut.description
        XCTAssertEqual(expected, result)
    }

    func testCreateReportDescriptionTwoProduct() {
        guard
            let productOne = ProductItem(input: "Product,79.99,49.98,5,false"),
            let productTwo = ProductItem(input: "Product,59.99,39.98,10,false")
        else {
            XCTFail("Creating productItem should work")
            return
        }
        sut = Report.createReport(name: "Clearance", products: [
            productOne, productTwo
        ])
        let expected = "Clearance: 2 products @ $39.98 - 49.98"
        let result = sut.description
        XCTAssertEqual(expected, result)
    }


}
