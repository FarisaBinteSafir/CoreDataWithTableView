//
//  ViewController.swift
//  relationTableCoreData
//
//  Created by Farisa on 1/28/20.
//  Copyright © 2020 Farisa. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var country = [Tableview1]()
    var selectedCountry: Int = 0
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest: NSFetchRequest<Tableview1> = Tableview1.fetchRequest()

        do{
            let country = try PersistenceService.context.fetch(fetchRequest)
            self.country = country
            self.tableView.reloadData()
        }
        catch{}
//
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tableview1")
//        do{
//            let country =  try managedContext.fetch(fetchRequest)
//            self.country = country as! [Tableview1]
//            self.tableView.reloadData()
//        }
//        catch{}
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add New Country", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Country name"
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            let countryName = alert.textFields!.first!.text!
            let item = Tableview1(context: PersistenceService.context)
            item.country_name = countryName
            PersistenceService.saveContext()
            self.country.append(item)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = country[indexPath.row].country_name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(country[indexPath.row].country_name as Any)
        print(country[indexPath.row].map!)
        selectedCountry = indexPath.row
        performSegue(withIdentifier: "show", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let divisionsViewController = segue.destination as? divisionsViewController else {return}
        divisionsViewController.country_name = country[selectedCountry]
        
    }
}

