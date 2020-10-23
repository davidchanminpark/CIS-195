//
//  AddContactViewController.swift
//  app4-chanmin-park
//
//  Created by David Park on 10/23/20.
//  Copyright © 2020 David Park. All rights reserved.
//

import UIKit

protocol AddContactDelegate: class {
    func didCreate(_ contact: Contact)
}

class AddContactViewController: UIViewController {

    weak var delegate: AddContactDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Contact"
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!

    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var phoneNum: UITextField!
    
    @IBAction func cancelAddContactAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAddContactAction(_ sender: Any) {
        if let newContact = createNewContact() {
            self.delegate?.didCreate(newContact)
        }
        
    }
    
    func createNewContact() -> Contact? {
        if firstName.text == "" {
            return nil
        }
        if lastName.text == "" {
            return nil
        }
        if company.text == "" {
            return nil
        }
        if email.text == "" {
            return nil
        }
        if phoneNum.text == "" {
            return nil
        }
        return Contact(firstName: firstName.text!, lastName: lastName.text!, company: company.text!, email: email.text!, phoneNum: phoneNum.text!, image: nil)
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
