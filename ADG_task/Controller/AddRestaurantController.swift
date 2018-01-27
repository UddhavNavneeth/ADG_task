//
//  AddRestaurantController.swift
//  ADG_task
//
//  Created by Sarvad shetty on 1/26/18.
//  Copyright © 2018 Sarvad shetty. All rights reserved.
//

import UIKit
import RealmSwift

class AddRestaurantController: UITableViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate{
    
    //MARK: Realm
    let realm = try! Realm()
    
    
    
    //MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var isVisited : Bool = false
    
         let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    
    
    //MARK: TableView method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
   
    //MARK: Image picker function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            imagePicker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage{
            imageView.contentMode = UIViewContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = image
            
            //MARK: NSLayoutConstraints
            //trailing
            let trailingConstaint = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem:imageView.superview , attribute: .trailing, multiplier: 1, constant: 0)
            trailingConstaint.isActive = true
            //leading
            let leadingConstraint = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: imageView.superview, attribute: .leading, multiplier: 1, constant: 0)
            leadingConstraint.isActive = true
            //top
            let topConstraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: imageView.superview, attribute: .top, multiplier: 1, constant: 0)
            topConstraint.isActive = true
            //bottom
            let bottomConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: imageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
            bottomConstraint.isActive = true
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        typeTextField.resignFirstResponder()
        locationTextField.resignFirstResponder()
        return true
    }
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let newItem = Restaurant()
         newItem.name = nameTextField.text!
         newItem.type = typeTextField.text!
         newItem.location = locationTextField.text!
        if let imageData = UIImageJPEGRepresentation(imageView.image!, 100){
         newItem.image = imageData
        }
         newItem.isVisited = isVisited
        save(restaurant: newItem)
        performSegue(withIdentifier: "unwindToHomeScreen", sender: self)
    }
    @IBAction func yesOrNo(_ sender: UIButton) {
        if sender.tag == 1{
            yesButton.backgroundColor = UIColor.red
            noButton.backgroundColor = UIColor.gray
            isVisited = true
            
        }
        else if sender.tag == 2{
            yesButton.backgroundColor = UIColor.gray
            noButton.backgroundColor = UIColor.red
            isVisited = false
        }
}
    //MARK: Model Manipulation
    func save(restaurant:Restaurant){
        do{
            try realm.write {
                realm.add(restaurant)
            }
        }
        catch{
            print(error)
        }
    }
    
    
}
