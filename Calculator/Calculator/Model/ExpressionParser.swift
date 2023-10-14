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
    // "1 2 3 + 3 4 5 - 2 3 1 / 1 2 3" => "[123,+,345,-,231,/,123]"
    func componentsByOperators(from input: String) -> [String] {
        var separatedElements = [input]
        for element in Operator.allCases {
            separatedElements = separatedElements[0].components(separatedBy: "\(element.rawValue)")
        }
        
        return separatedElements
    }
}

//struct Formula {
//    var operands: CalculatorItemQueue<Double>
//    var operators: CalculatorItemQueue<Operator>
//
//    func result() -> Double {
//        return 1.0
//    }
//}
