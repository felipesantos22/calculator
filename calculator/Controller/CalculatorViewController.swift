//
//  CalculatorViewController.swift
//  calculator
//
//  Created by Felipe Santos on 28/03/25.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let calculatorView = CalculatorView()
    let calculatorModel = CalculatorModel()
    
    override func loadView() {
        view = calculatorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupActions()
    }
    
    private func setupActions() {
        calculatorView.uiBtnPlus.addTarget(self, action: #selector(plus), for: .touchUpInside)
        calculatorView.uiBtnMinus.addTarget(self, action: #selector(minus), for: .touchUpInside)
        calculatorView.uiBtnDiv.addTarget(self, action: #selector(div), for: .touchUpInside)
        calculatorView.uiBtnMul.addTarget(self, action: #selector(mul), for: .touchUpInside)
    }
    
    @objc func plus() {
        if let num1 = Double(calculatorView.uitextField.text ?? ""),
           let num2 = Double(calculatorView.uitextFieldOne.text ?? "") {
            let result = calculatorModel.add(num1, num2)
            calculatorView.uiLabelResult.text = String(result)
        }
    }
    
    @objc func minus() {
        if let num1 = Double(calculatorView.uitextField.text ?? ""),
           let num2 = Double(calculatorView.uitextFieldOne.text ?? "") {
            let result = calculatorModel.subtract(num1, num2)
            calculatorView.uiLabelResult.text = String(result)
        }
    }
    
    @objc func div() {
        if let num1 = Double(calculatorView.uitextField.text ?? ""),
           let num2 = Double(calculatorView.uitextFieldOne.text ?? "") {
            let result = calculatorModel.divide(num1, num2)
            calculatorView.uiLabelResult.text = String(result)
        }
    }
    
    @objc func mul() {
        if let num1 = Double(calculatorView.uitextField.text ?? ""),
           let num2 = Double(calculatorView.uitextFieldOne.text ?? "") {
            let result = calculatorModel.multiply(num1, num2)
            calculatorView.uiLabelResult.text = String(result)
        }
    }
}
