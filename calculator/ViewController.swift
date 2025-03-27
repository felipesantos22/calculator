//
//  ViewController.swift
//  calculator
//
//  Created by Felipe Santos on 26/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    let uiLabel: UILabel = {
        let label = UILabel()
        label.text = "Calculadora"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)!
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let uitextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 20)!
        textField.placeholder = "100"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let uitextFieldOne: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 20)!
        textField.placeholder = "50"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let uiBtnPlus: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)!
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.1
        button.layer.borderColor = UIColor.black.cgColor
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let uiBtnMinus: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)!
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.1
        button.layer.borderColor = UIColor.black.cgColor
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let uiBtnDiv: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("%", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)!
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.1
        button.layer.borderColor = UIColor.black.cgColor
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let uiBtnMul: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("x", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)!
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.1
        button.layer.borderColor = UIColor.black.cgColor
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    @objc func plus(){
        print("plus")
    }
    
    @objc func minus(){
        print("minus")
    }
    
    @objc func div(){
        print("div")
    }
    
    @objc func mul(){
        print("mul")
    }
    
    
    let uiLabelResult: UILabel = {
        let result = UILabel()
        result.text = "RESULTADO"
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(uiLabel)
        view.addSubview(uitextField)
        view.addSubview(uitextFieldOne)
        view.addSubview(uiLabelResult)
        
        uiBtnPlus.addTarget(self, action: #selector(plus), for: .touchUpInside)
        uiBtnMinus.addTarget(self, action: #selector(minus), for: .touchUpInside)
        uiBtnDiv.addTarget(self, action: #selector(div), for: .touchUpInside)
        uiBtnMul.addTarget(self, action: #selector(mul), for: .touchUpInside)
        
        addLabel()
        addTextField()
        addTextFieldOne()
        setupButtons()
    }
    
    
    func addLabel(){
        NSLayoutConstraint.activate([
            uiLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            uiLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            uiLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
    }
    
    func addTextField(){
        NSLayoutConstraint.activate([
            uitextField.topAnchor.constraint(equalTo: uiLabel.bottomAnchor, constant: 30),
            uitextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uitextField.widthAnchor.constraint(equalToConstant: 180),
            uitextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func addTextFieldOne(){
        NSLayoutConstraint.activate([
            uitextFieldOne.topAnchor.constraint(equalTo: uitextField.bottomAnchor, constant: 30),
            uitextFieldOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uitextFieldOne.widthAnchor.constraint(equalToConstant: 180),
            uitextFieldOne.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [uiBtnPlus, uiBtnMinus, uiBtnDiv, uiBtnMul])
        stackView.axis = .horizontal // Mantém os botões na horizontal
        stackView.spacing = 20 // Espaçamento entre os botões
        stackView.alignment = .fill
        stackView.distribution = .fillEqually // Distribui o espaço de forma igual
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: uitextFieldOne.bottomAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30), // Espaço da esquerda
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30), // Espaço da direita
            stackView.heightAnchor.constraint(equalToConstant: 40) // Altura fixa dos botões
        ])
    }
    
    func addResultLabel() {
        NSLayoutConstraint.activate([
            uiLabelResult.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            uiLabelResult.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    
}

