//
//  ViewController.swift
//  app0_park_chanmin
//
//  Created by David Park on 9/11/20.
//  Copyright © 2020 Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorTxt: UILabel!
    
    @IBAction func changeColor(_ sender: UIButton) {
        switch colorTxt.text {
            case "Blue":
                colorTxt.text = "Red"
                colorTxt.textColor = .red
                sender.setTitle("Turn Blue", for: .normal)
            case "Red":
                colorTxt.text = "Blue"
                colorTxt.textColor = .blue
                sender.setTitle("Turn Red", for: .normal)
            default:
                colorTxt.text = "Red"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorTxt.text = "Blue"
        colorTxt.textColor = .blue
    }


}

