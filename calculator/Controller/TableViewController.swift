//
//  TableViewController.swift
//  calculator
//
//  Created by Felipe Santos on 27/03/25.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var operation : [Operation] = []
    var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext!) {
        self.context = context
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        
        title = "RESULTADOS"
        
        view.backgroundColor = .white
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    func fetchData() {
        let fetchRequest: NSFetchRequest<Operation> = Operation.fetchRequest()
        
        do {
            operation = try context.fetch(fetchRequest)
            print("Dados carregados: \(operation.count) operações")
            tableView.reloadData()
        } catch {
            print("Erro ao fetch \(error)")
        }
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return operation.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let operationData = operation[indexPath.row]
        cell.configure(with: operationData)
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteOperation = operation[indexPath.row]
            context.delete(deleteOperation)
            operation.remove(at: indexPath.row)
            
            do {
                try context.save()
                tableView.deleteRows(at: [indexPath], with: .fade)
            }catch let error as NSError {
                print("Erro ao salvar: \(error), \(error.userInfo)")
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

