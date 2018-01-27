//
//  RestaurantTableViewController.swift
//  ADG_task
//
//  Created by Sarvad shetty on 1/11/18.
//  Copyright © 2018 Sarvad shetty. All rights reserved.
//

import UIKit
import RealmSwift

class RestaurantTableViewController: UITableViewController {
    
    let realm = try! Realm()
 
    var restaurants : Results<Restaurant>?
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
         navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        
        //load()
        tableView.reloadData()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
        load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants?.count ?? 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        if let res = restaurants?[indexPath.row]{
        cell.nameLabel.text = res.name
        cell.thumbnailImageView.image = UIImage(data: res.image!)
        cell.thumbnailImageView.layer.cornerRadius = 30.0
        cell.thumbnailImageView.clipsToBounds = true
        cell.locationLabel.text = res.location
        cell.typeLabel.text = res.type
        cell.accessoryType = res.isVisited == true ? .checkmark : .none
        }
        return cell
    }
    
    //MARK: Tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareButton = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            if let imageToShare = UIImage(data: self.restaurants![indexPath.row].image!) {
                  let activityController = UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
                 self.present(activityController, animated: true, completion: nil)
            }
        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
     
            do{
                try self.realm.write {
                    self.realm.delete(self.restaurants![indexPath.row])
                }
            }catch{
                print("error while deleting,\(error)")
            }
            self.load()
            tableView.reloadData()
           //rants.remove(at: indexPath.row)
      
        }
        shareButton.backgroundColor = UIColor(displayP3Red: 82.0/255.0, green: 179.0/255.0, blue: 217.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(displayP3Red: 242.0/255.0, green: 38.0/255.0, blue: 19.0/255.0, alpha: 1.0)
        
        return [deleteAction,shareButton]
    }
    
    //MARK: Segue properties
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationVc = segue.destination as! RestaurantDetailViewController
                destinationVc.restaurants = restaurants![indexPath.row]
            }
        }
    }
    //MARK: IBActions
    @IBAction func uwindToHomeScreen(segue:UIStoryboardSegue){
        
    }
    
    //MARK: Model Manipulation
   
    func load(){
        restaurants = realm.objects(Restaurant.self)
        tableView.reloadData()
    }
}
