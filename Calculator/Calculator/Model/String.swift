//
//  String.swift
//  Calculator
//
//  Created by hyunMac on 10/14/23.
//

extension String {
    func split(with target: Character) -> [String] {
        let splitedString = self.split(separator: target).map {String($0)}
        
        return splitedString
    }
}
