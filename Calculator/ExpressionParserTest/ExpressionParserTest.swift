//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by hyunMac on 10/17/23.
//

import XCTest
@testable import Calculator

final class ExpressionParserTest: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // "" , 1,  1+2 , 1-2, 1 - -2, 1 + ,
    
    func test_E() {
        sut = ExpressionParser.parse(from: "10+2/3")
        
        XCTAssertEqual(sut.operands.dequeue(), 10.0)
        XCTAssertEqual(sut.operands.dequeue(), 2.0)
        XCTAssertEqual(sut.operands.dequeue(), 3.0)
        XCTAssertEqual(sut.operators.dequeue(), .add)
        XCTAssertEqual(sut.operators.dequeue(), .divide)
    }
}
