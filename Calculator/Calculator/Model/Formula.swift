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
            return 0.0
        }
        guard let rhs = operands.dequeue() else {
            return 0.0
        }
        
        var symbol = operators.dequeue()
        
        guard let calcultateResult = symbol?.calculate(lhs: lhs, rhs: rhs) else {
            return 0.0
        }
        
        lhs = calcultateResult
        
        return lhs
    }
}
//
//enum Operator: Character, CaseIterable, CalculatorItem {
//    case add = "+"
//    case subtract = "-"
//    case divide = "/"
//    case multiply = "*"
//    
//    func calculate(lhs: Double, rhs: Double) -> Double {
//        switch self {
//        case .add:
//            return add(lhs: lhs, rhs: rhs)
//        case .subtract:
//            return subtract(lhs: lhs, rhs: rhs)
//        case .divide:
//            return divide(lhs: lhs, rhs: rhs)
//        case .multiply:
//            return multiply(lhs: lhs, rhs: rhs)
//        }
//    }
//    
//    func add(lhs: Double, rhs: Double) -> Double {
//        return lhs + rhs
//    }
//    
//    func subtract(lhs: Double, rhs: Double) -> Double {
//        return lhs - rhs
//    }
//    
//    func divide(lhs: Double, rhs: Double) -> Double {
//        return lhs / rhs
//    }
//    
//    func multiply(lhs: Double, rhs: Double) -> Double {
//        return lhs * rhs
//    }
//    
//}
