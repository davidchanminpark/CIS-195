//
//  ContactsTableTableViewController.swift
//  app4-chanmin-park
//
//  Created by David Park on 10/23/20.
//  Copyright © 2020 David Park. All rights reserved.
//

import UIKit

class ContactsTableTableViewController: UITableViewController, AddContactDelegate {
    
    func didCreate(_ contact: Contact) {
        dismiss(animated: true, completion: nil)
        contacts.append(contact)
        contacts.sort(by: { $0.lastName < $1.lastName} )
        self.tableView.reloadData()
    }
    
    
    var contacts = [Contact]()
    var rowSelected = 0

    let newContactMe = Contact(firstName: "Chanmin", lastName: "Park", company: "CIS195", email: "xxx@sas.upenn.edu", phoneNum: "111-222-3333", image: nil)
    let newContactFriend = Contact(firstName: "Damin", lastName: "Park", company: "Facebook", email: "yyy@gmail.com", phoneNum: "421-234-1232", image: nil)

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        
        contacts.append(newContactMe)
        contacts.append(newContactFriend)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func addContactAction(_ sender: Any) {
        self.performSegue(withIdentifier: "addContact", sender: sender)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact_default", for: indexPath)
        
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.firstName + " " + contact.lastName
        
        cell.detailTextLabel?.text = contact.email
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        self.performSegue(withIdentifier: "viewDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "viewDetail") {
            let vc = segue.destination as! DetailViewController
            let contact = contacts[rowSelected]
            vc.firstName = contact.firstName
            vc.lastName = contact.lastName
            vc.email = contact.email
            vc.company = contact.company
            vc.phoneNum = contact.phoneNum
            vc.image = contact.image
        }
        if (segue.identifier == "addContact") {
            let nc = segue.destination as! UINavigationController
            let vc = nc.topViewController as! AddContactViewController
            vc.delegate = self
        }
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
