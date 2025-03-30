//
//  TabBarController.swift
//  calculator
//
//  Created by Felipe Santos on 28/03/25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar()
    }
    
    func tabBar(){
        
        // Acesse o contexto diretamente do AppDelegate
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let calculatorViewController = CalculatorViewController()
        let tableViewController = TableViewController(context: context)
    
        
        let navigationController = UINavigationController(rootViewController: calculatorViewController)
        let navigationController2 = UINavigationController(rootViewController: tableViewController)
        
        navigationController.tabBarItem = UITabBarItem(title: "Calculadora", image: UIImage(systemName: "numbers"), selectedImage: nil)
        navigationController2.tabBarItem = UITabBarItem(title: "Histórico", image: UIImage(systemName: "list.bullet"), selectedImage: nil)
        
        self.viewControllers = [navigationController, navigationController2]
        
        tabBar.tintColor = .white
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .lightGray
        
        
    }

}
