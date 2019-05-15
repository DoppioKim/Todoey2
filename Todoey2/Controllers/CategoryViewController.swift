//
//  CategoryViewController.swift
//  Todoey2
//
//  Created by Jiyoung on 15/05/2019.
//  Copyright © 2019 Jiyoung Kim. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    
    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategory()

    }
    
    //MARK: - TableView Datasource Methods
    //display the categories
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let categoryItem = categoryArray[indexPath.row]
        cell.textLabel?.text = categoryItem.name
        
        return cell
    }
    
    
    //MARK: - Data Manipulation Methods
    //save and load data
    
    func saveCategory() {
        do {
            try context.save()
        } catch {
            print ("error saving category, \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    
    func loadCategory() {
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
        categoryArray = try context.fetch(request)
        } catch {
            print ("error fetching/loading category, \(error)")
        }
        
        tableView.reloadData()
    }
    
//    func loadCategory(request: NSFetchRequest<Category>) {
//
//        do {
//            categoryArray = try context.fetch(request)
//        } catch {
//            print ("error fetching/loading category, \(error)")
//        }
//
//        tableView.reloadData()
//
//    }
    
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Confirm", style: .default) { (alertAction) in
            
            let newCategory = Category(context: self.context)
            
            newCategory.name = textField.text!
            
            self.categoryArray.append(newCategory)
            self.tableView.reloadData()
            
            self.saveCategory()
        }
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type in a new category"
            textField = alertTextField
        }
        
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    

    
    //MARK: - TableView Delegate Methods
    //what should happen when you click one of the cells
    
    
}
