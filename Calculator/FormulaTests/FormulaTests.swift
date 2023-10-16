//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by hyunMac on 10/17/23.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_E() {
        sut.operators.enqueue(Operator.add)
        sut.operands.enqueue(1)
        sut.operands.enqueue(2)
        
        let result = sut.result()
        
        XCTAssertEqual(result, 3)
    }
    

}
