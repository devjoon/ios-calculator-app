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
        sut = Formula(operands: <#CalculatorItemQueue<Double>#>, operators: <#CalculatorItemQueue<Operator>#>)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // "" , 1,  1+2 , 1-2, 1 - -2, 1 + ,
    
    func test_ExpressionParser의_parse실행시_매개변수로_빈_문자열을_할당했을때_operands와_operators가_비어있는지() {
        //given
        let input = ""
        //when
        var result = ExpressionParser.parse(from: input)
        
        //then
        XCTAssertTrue(result.operands.isEmpty())
        XCTAssertTrue(result.operators.isEmpty())
    }
    
    func test_ExpressionParser의_parse실행시_매개변수로_숫자_하나를_할당했을때_operands에_첫번째로들어있는지() {
        //given
        let input = "1"
        //when
        var result = ExpressionParser.parse(from: input)
        
        //then
        XCTAssertEqual(Double(input), result.operands.peek())
    }
    
    func test_ExpressionParser의_parse실행시_매개변수로_숫자_하나를_할당후_사칙연산기호_하나를_할당했을때_operands에_숫자가_첫번째로_들어있고_operator에_기호가_첫번째로_들어있는지() {
        //given
        let input = "1+2"
        //when
        var result = ExpressionParser.parse(from: input)
        
        //then
    }
    
}
