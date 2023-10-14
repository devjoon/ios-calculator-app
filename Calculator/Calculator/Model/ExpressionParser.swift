//
//  ExpressionParser.swift
//  Calculator
//
//  Created by hyunMac on 10/14/23.
//

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let separatedElements = componentsByOperators(from: input)
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        separatedElements.compactMap {Double($0)}.forEach{operands.enqueue($0)}
        
        input.forEach {
            if let element = Operator(rawValue: $0) {
                operators.enqueue(element)
            }
        }
        
        return Formula(operands: operands, operators: operators)
        
    }

    func componentsByOperators(from input: String) -> [String] {
        var separatedElements = [input]
        for element in Operator.allCases {
            separatedElements = separatedElements[0].components(separatedBy: "\(element.rawValue)")
        }
        
        return separatedElements
    }
}
