//
//  Formula.swift
//  Calculator
//
//  Created by hyunMac on 10/14/23.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        return 1.0
    }
}
