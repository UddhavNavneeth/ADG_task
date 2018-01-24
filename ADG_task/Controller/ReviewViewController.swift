//
//  ReviewViewController.swift
//  ADG_task
//
//  Created by Sarvad shetty on 1/17/18.
//  Copyright © 2018 Sarvad shetty. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var ratingStackView: UIStackView!
    
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var greatButton: UIButton!
    
    
    
    var rating:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        let translate = CGAffineTransform.init(translationX: 0, y: 500)
        let scale = CGAffineTransform.init(scaleX: 0.0, y: 0.0).concatenating(translate)
        dislikeButton.transform = scale
        goodButton.transform = scale
        greatButton.transform = scale
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.4, delay: 0.0,options: [], animations: {
            self.dislikeButton.transform = CGAffineTransform.identity
      
        }, completion: nil)
        UIView.animate(withDuration: 0.6, delay: 0.0,options: [], animations: {
   
            self.goodButton.transform = CGAffineTransform.identity
          
        }, completion: nil)
        UIView.animate(withDuration: 0.8, delay: 0.0,options: [], animations: {
        
            self.greatButton.transform = CGAffineTransform.identity
        }, completion: nil)
      
    }
    @IBAction func ratingSelected(_ sender: UIButton) {
        
        switch sender.tag {
        case 100:
            rating = "dislike"
            break
        case 200:
            rating = "good"
            break
        case 300:
            rating = "great"
            break
        default:
            break
        }
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
}
