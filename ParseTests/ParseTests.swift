//
//  ParseTests.swift
//  ParseTests
//
//  Created by Bradley Calkins on 5/16/22.
//

import XCTest

class ParseTests: XCTestCase {

    let sut = ProductParser()
    let document = """
    Type,normal,Normal Price
    Type,clearance,Clearance Price
    Type,price_in_cart,Price In Cart
    Product,59.99,39.98,10,false
    Product,49.99,49.99,8,false
    Product,79.99,49.98,5,false
    """
    func testParseDocumentProducts() {
        _  = sut.parse(document: document)
        let expectedProducts = 3
        let resultingProducts = sut.products.count
        XCTAssertEqual(expectedProducts, resultingProducts)
    }

    func testParseDocumentPriceTypes() {
        _  = sut.parse(document: document)
        let expectedPriceTypes = 3
        let resultingPriceTypes = sut.priceTypes.count
        XCTAssertEqual(expectedPriceTypes, resultingPriceTypes)
    }

    func testParseEntryClearance() {
        let inputLine = "Product,79.99,49.98,5,false"
        sut.parse(line: inputLine)
        if let firstProduct = sut.products.first {
            XCTAssertTrue(firstProduct.isClearance)
        } else {
            XCTFail("First product expected to be parsed")
        }
    }

    func testParseEntryNormalPrice() {
        let inputLine = "Product,49.99,49.99,8,false"
        sut.parse(line: inputLine)
        if let firstProduct = sut.products.first {
            XCTAssertFalse(firstProduct.isClearance)
        } else {
            XCTFail("First product expected to be parsed")
        }
    }

}
