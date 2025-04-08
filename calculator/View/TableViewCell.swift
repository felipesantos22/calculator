//
//  TableViewCell.swift
//  calculator
//
//  Created by Felipe Santos on 27/03/25.
//

import UIKit
import CoreData

class TableViewCell: UITableViewCell {
    
    let labelResult: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0 // Permite múltiplas linhas caso necessário
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    /*override func layoutSubviews() {
     super.layoutSubviews()
     contentView.layoutIfNeeded()
     contentView.frame = contentView.frame.insetBy(dx: 16, dy: 0)
     }*/
    
    private func setupCell() {
        addSubview(labelResult)
        addSubview(labelDate)
        
        NSLayoutConstraint.activate([
            labelResult.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            labelResult.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            labelDate.topAnchor.constraint(equalTo: labelResult.bottomAnchor, constant: 4),
            labelDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8) 
        ])
    }
    
    func configure(with operation: Operation) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        labelResult.text = "\(operation.result)"
        
        if let timestamp = operation.timestamp {
            labelDate.text = formatter.string(from: timestamp)
        } else {
            labelDate.text = "Data indisponível" // Evita mostrar uma data errada
        }
    }
}
