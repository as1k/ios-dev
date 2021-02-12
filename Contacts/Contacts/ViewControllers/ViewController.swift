//
//  ViewController.swift
//  Contacts
//
//  Created by Асыланбек Нурмухамбет on 2/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var contactModel = ContactModel()
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var noContactsLabel: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableSize = contactModel.getContacts().count
        if (tableSize == 0) {
            noContactsLabel.isHidden = false
        } else {
            noContactsLabel.isHidden = true
        }
        return tableSize
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.contactName?.text = contactModel.getContacts()[indexPath.row].name_surname
        cell?.contactPhone?.text = contactModel.getContacts()[indexPath.row].phone
        cell?.contactImageView?.image = contactModel.getContacts()[indexPath.row].image
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            contactModel.deleteContact(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noContactsLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let index = (myTableView.indexPathForSelectedRow?.row)!
            let destionation = segue.destination as! DetailViewController
            destionation.name_surname = contactModel.getContacts()[index].name_surname
            destionation.phone = contactModel.getContacts()[index].phone
            destionation.image = contactModel.getContacts()[index].image
            destionation.currentIndex = index
            destionation.actionsProtocol = self
        } else if segue.identifier == "addContactSegue" {
            let destionation = segue.destination as! AddContactViewController
            destionation.genders = contactModel.getGenders()
            destionation.actionsProtocol = self
        }
    }
}

extension ViewController: ActionsProtocol {
    
    func addContact(nameSurname: String, phoneNumber: String, gender: String) {
        let newContact = Contact.init(nameSurname, phoneNumber, UIImage.init(named: gender)!)
        
        contactModel.addNewContact(newContact)
        myTableView.reloadData()
    }
    
    
    func deleteContact(nameSurname: String, phoneNumber: String, index: Int) {
        contactModel.deleteContact(index)
        myTableView.reloadData()
    }
}
