//
//  divisionsViewController.swift
//  relationTableCoreData
//
//  Created by Farisa on 1/30/20.
//  Copyright © 2020 Farisa. All rights reserved.
//

import UIKit
import CoreData

class divisionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var country = [Tableview1]()
    var divisions = [Tableview2]()
    var div = Tableview2(context: PersistenceService.context)
    @IBOutlet weak var tableView: UITableView!
    
    var country_name = Tableview1(context: PersistenceService.context)
    var numberOfCellsTable:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(country_name)
        print(country_name.map?.count)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add division name", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Division name"
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            let divisionName = alert.textFields!.first!.text!
            //let age = alert.textFields!.last!.text!
            let division = Tableview2(context: PersistenceService.context)
            print(divisionName)
            division.division_name = divisionName
            division.map2 = self.country_name
            //division.map2 = self.country_name
            self.country_name.addToMap(division)
            
            PersistenceService.saveContext()
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfCellsTable = country_name.map?.count ?? 0
        return numberOfCellsTable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        print((country_name.map?.allObjects[indexPath.row] as! Tableview2).division_name!)
        cell.textLabel?.text = (country_name.map?.allObjects[indexPath.row] as! Tableview2).division_name!
        return cell
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
