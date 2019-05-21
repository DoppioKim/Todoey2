//
//  CategoryViewController.swift
//  Todoey2
//
//  Created by Jiyoung on 15/05/2019.
//  Copyright © 2019 Jiyoung Kim. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categoryArray: Results<Category>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadCategory()

    }
    
    //MARK: - TableView Datasource Methods
    //display the categories
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)

        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No Categories Added"
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(categoryArray![indexPath.row].name)")
        performSegue(withIdentifier: "goToItems", sender: self)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
        }

    }
    
    //MARK: - Data Manipulation Methods
    //save and load data
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print ("error saving category, \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    
    func loadCategory() {
        
        categoryArray = realm.objects(Category.self)
        tableView.reloadData()
    }
    
    
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Confirm", style: .default) { (alertAction) in
            
            let newCategory = Category()
            
            newCategory.name = textField.text!
            self.tableView.reloadData()
            
            self.save(category: newCategory)
            
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
