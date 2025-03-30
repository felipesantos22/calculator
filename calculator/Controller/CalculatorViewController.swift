//
//  CalculatorViewController.swift
//  calculator
//
//  Created by Felipe Santos on 28/03/25.
//

import UIKit
import CoreData

class CalculatorViewController: UIViewController {
    
    var context : NSManagedObjectContext!
    let calculatorView = CalculatorView()
    let calculatorModel = CalculatorModel()
    var tableViewController : TableViewController!
    
    
    override func loadView() {
        view = calculatorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dimissKeyboard))
        view.addGestureRecognizer(tap)
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        tableViewController = TableViewController(context: context)
        
        setupActions()
    }
    
    private func setupActions() {
        calculatorView.uiBtnPlus.addTarget(self, action: #selector(plus), for: .touchUpInside)
        calculatorView.uiBtnMinus.addTarget(self, action: #selector(minus), for: .touchUpInside)
        calculatorView.uiBtnDiv.addTarget(self, action: #selector(div), for: .touchUpInside)
        calculatorView.uiBtnMul.addTarget(self, action: #selector(mul), for: .touchUpInside)
    }
    
    func saveResult(_ value1: Double, _ value2: Double, _ result: Double) {
        let operation = Operation(context: context)
        operation.num1 = value1
        operation.num2 = value2
        operation.result = result
        operation.timestamp = Date()
        
        do {
            try context.save()
            print("Operação salva com sucesso!")
            // Atualiza a tabela após salvar
            self.reloadTableViewData()
        } catch {
            print("Erro ao salvar: \(error)")
        }
    }
    
    func reloadTableViewData() {
        DispatchQueue.main.async {
            self.tableViewController.fetchData() // Recarregar dados de operação
            self.tableViewController.tableView.reloadData() // Forçar a atualização da tabela
        }
    }
    
    
    @objc func plus() {
        if let num1 = Double(calculatorView.uitextField.text ?? ""),
           let num2 = Double(calculatorView.uitextFieldOne.text ?? "") {
            let result = calculatorModel.add(num1, num2)
            calculatorView.uiLabelResult.text = String(result)
            print("Salvando operação: \(num1) + \(num2) = \(result)")
            saveResult(num1, num2, result)
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
    
    @objc func dimissKeyboard() {
        view.endEditing(true)
    }
}
