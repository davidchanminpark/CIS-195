//
//  ViewController.swift
//  NationalParks
//
//  Created by Chanmin Park on 11/11/20.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var parkName: String = ""
    var parkType: String = ""
    var parkImageURL: String? = nil
    var parkDescription: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let parkImageURL = parkImageURL {
            let url = URL(string: parkImageURL)
            detailParkImageView.kf.setImage(with: url)
        }
        detailParkName.text = parkName
        detailParkType.text = parkType
        detailParkDescription.text = parkDescription
    }

    @IBOutlet weak var detailParkImageView: UIImageView!
    
    @IBOutlet weak var detailParkName: UILabel!
    @IBOutlet weak var detailParkType: UILabel!
    
    @IBOutlet weak var detailParkDescription: UITextView!
}

