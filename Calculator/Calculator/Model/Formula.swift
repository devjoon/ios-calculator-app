//
//  Formula.swift
//  Calculator
//
//  Created by hyunMac on 10/14/23.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var lhs = operands.dequeue() else {
            return Double.zero
        }
        
        while let symbol = operators.dequeue(), let rhs = operands.dequeue() {
            lhs = symbol.calculate(lhs: lhs, rhs: rhs)
        }
        
        return lhs
    }
}
