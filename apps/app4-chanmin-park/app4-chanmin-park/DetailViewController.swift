//
//  DetailViewController.swift
//  app4-chanmin-park
//
//  Created by David Park on 10/23/20.
//  Copyright © 2020 David Park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var company = ""
    var phoneNum = ""
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contact Detail"
        // Do any additional setup after loading the view.
        nameView.text = firstName + " " + lastName
        companyView.text = company
        emailView.text = email
        phoneNumView.text = phoneNum
        imageView.image = image
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.size.height/2
    }
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameView: UILabel!
    
    @IBOutlet weak var companyView: UILabel!
    @IBOutlet weak var emailView: UILabel!
    
    @IBOutlet weak var phoneNumView: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
