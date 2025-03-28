//
//  CalculatorModel.swift
//  calculator
//
//  Created by Felipe Santos on 28/03/25.
//

import UIKit

// MARK: - Model
class CalculatorModel {
    func add(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    
    func subtract(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
    
    func divide(_ a: Double, _ b: Double) -> Double {
        return a / b
    }
    
    func multiply(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}
