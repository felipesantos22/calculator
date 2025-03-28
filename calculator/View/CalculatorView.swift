//
//  CalculatorView.swift
//  calculator
//
//  Created by Felipe Santos on 28/03/25.
//

import UIKit

class CalculatorView: UIView {
    
    let uiLabel = UILabel()
    let uitextField = UITextField()
    let uitextFieldOne = UITextField()
    let uiBtnPlus = UIButton(type: .system)
    let uiBtnMinus = UIButton(type: .system)
    let uiBtnDiv = UIButton(type: .system)
    let uiBtnMul = UIButton(type: .system)
    let uiStackView = UIStackView()
    let uiLabelResult = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        uiLabel.text = "Calculadora"
        uiLabel.textColor = .black
        uiLabel.textAlignment = .center
        uiLabel.font = UIFont(name: "HelveticaNeue-Light", size: 30)!
        
        uitextField.textColor = .black
        uitextField.textAlignment = .center
        uitextField.font = UIFont(name: "HelveticaNeue-Light", size: 20)!
        uitextField.placeholder = "100"
        uitextField.layer.borderColor = UIColor.black.cgColor
        uitextField.layer.borderWidth = 1
        uitextField.layer.cornerRadius = 5
        uitextField.keyboardType = .decimalPad
        
        uitextFieldOne.textColor = .black
        uitextFieldOne.textAlignment = .center
        uitextFieldOne.font = UIFont(name: "HelveticaNeue-Light", size: 20)!
        uitextFieldOne.placeholder = "50"
        uitextFieldOne.layer.borderColor = UIColor.black.cgColor
        uitextFieldOne.layer.borderWidth = 1
        uitextFieldOne.layer.cornerRadius = 5
        uitextFieldOne.keyboardType = .decimalPad
        
        uiStackView.axis = .horizontal // Mantém os botões na horizontal
        uiStackView.spacing = 30 // Espaçamento entre os botões
        uiStackView.alignment = .fill
        uiStackView.distribution = .fillEqually // Distribui o espaço de forma igual
        uiStackView.translatesAutoresizingMaskIntoConstraints = false
        
        uiBtnPlus.setTitle("+", for: .normal)
        uiBtnPlus.layer.cornerRadius = 5
        uiBtnPlus.layer.borderWidth = 0.1
        uiBtnPlus.layer.borderColor = UIColor.black.cgColor
        
        uiBtnMinus.setTitle("-", for: .normal)
        uiBtnMinus.layer.cornerRadius = 5
        uiBtnMinus.layer.borderWidth = 0.1
        uiBtnMinus.layer.borderColor = UIColor.black.cgColor
        
        uiBtnDiv.setTitle("%", for: .normal)
        uiBtnDiv.layer.cornerRadius = 5
        uiBtnDiv.layer.borderWidth = 0.1
        uiBtnDiv.layer.borderColor = UIColor.black.cgColor
        
        uiBtnMul.setTitle("x", for: .normal)
        uiBtnMul.layer.cornerRadius = 5
        uiBtnMul.layer.borderWidth = 0.1
        uiBtnMul.layer.borderColor = UIColor.black.cgColor
        
        uiLabelResult.text = "RESULTADO"
        uiLabelResult.font = UIFont(name: "HelveticaNeue-Light", size: 20)!
        uiLabelResult.textColor = .black
        
        
        [uiLabel, uitextField, uitextFieldOne, uiBtnPlus, uiBtnMinus, uiBtnDiv, uiBtnMul, uiStackView, uiLabelResult].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        
    }
    
    private func setupConstraints() {
        
        uiStackView.addArrangedSubview(uiBtnPlus)
        uiStackView.addArrangedSubview(uiBtnMinus)
        uiStackView.addArrangedSubview(uiBtnDiv)
        uiStackView.addArrangedSubview(uiBtnMul)
        
        addSubview(uiStackView)
        
        NSLayoutConstraint.activate([
            uiLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            uiLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            uitextField.topAnchor.constraint(equalTo: uiLabel.bottomAnchor, constant: 30),
            uitextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            uitextField.widthAnchor.constraint(equalToConstant: 180),
            uitextField.heightAnchor.constraint(equalToConstant: 40),
            
            uitextFieldOne.topAnchor.constraint(equalTo: uitextField.bottomAnchor, constant: 30),
            uitextFieldOne.centerXAnchor.constraint(equalTo: centerXAnchor),
            uitextFieldOne.widthAnchor.constraint(equalToConstant: 180),
            uitextFieldOne.heightAnchor.constraint(equalToConstant: 40),
            
            uiStackView.topAnchor.constraint(equalTo: uitextFieldOne.bottomAnchor, constant: 40),
            uiStackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            uiStackView.widthAnchor.constraint(equalToConstant: 300),
            uiStackView.heightAnchor.constraint(equalToConstant: 50),
            
            uiLabelResult.topAnchor.constraint(equalTo: uiStackView.bottomAnchor, constant: 40),
            uiLabelResult.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    
    }
}
