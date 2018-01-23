//
//  RestaurantDetailViewController.swift
//  ADG_task
//
//  Created by Sarvad shetty on 1/12/18.
//  Copyright © 2018 Sarvad shetty. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    var restaurants:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(named: restaurants.image)
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        //tableView.backgroundColor = UIColor(red: 0.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        title = restaurants.name
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    //MARK: TABLEVIEW DATASOURCE METHODS
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! RestaurantDetailTableViewCell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurants.name
            break
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurants.type
            break
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurants.location
            break
        case 3:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = (restaurants.isVisited) ?"Yes, I've been here before" :"No"
            break
        case 4:
            cell.fieldLabel.text = "Phone"
            cell.valueLabel.text = restaurants.phoneNumber
            break
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
            break
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    @IBAction func close(segue:UIStoryboardSegue){
        
    }
 
}
