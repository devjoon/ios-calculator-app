//
//  ExpressionParser.swift
//  Calculator
//
//  Created by hyunMac on 10/14/23.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let separatedElements = componentsByOperators(from: input)
        var formula = Formula()
        
        separatedElements.compactMap {Double($0)}.forEach{formula.operands.enqueue($0)}
        
        input.forEach {
            if let element = Operator(rawValue: $0) {
                formula.operators.enqueue(element)
            }
        }
        
        return formula
    }

    static func componentsByOperators(from input: String) -> [String] {
        var separtedElements = [String]()
        var temp = ""
        
        for element in input {
            if element.isNumber {
                temp.append(element)
            } else {
                separtedElements.append(temp)
                temp = ""
            }
        }
        separtedElements.append(temp)
        
        return separtedElements
    }
}
