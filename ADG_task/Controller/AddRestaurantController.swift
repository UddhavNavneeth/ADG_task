//
//  AddRestaurantController.swift
//  ADG_task
//
//  Created by Sarvad shetty on 1/26/18.
//  Copyright © 2018 Sarvad shetty. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var imageView: UIImageView!
    
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
            let topConstraint = NSLayoutConstraint(item: image, attribute: .top, relatedBy: .equal, toItem: imageView.superview, attribute: .top, multiplier: 1, constant: 0)
            topConstraint.isActive = true
            //bottom
            let bottomConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: imageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
            bottomConstraint.isActive = true
        }
    }
}
