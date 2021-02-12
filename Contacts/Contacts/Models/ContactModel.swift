//
//  ContactModel.swift
//  Contacts
//
//  Created by Асыланбек Нурмухамбет on 2/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

struct ContactModel{
    
    private var contacts = [
        Contact.init("Vasya Pupkin", "+77089871231", UIImage.init(named: "female")!),
        Contact.init("Vladimir Putin", "95999999999", UIImage.init(named: "male")!),
        Contact.init("Palenshe Pugenshiev", "123123123", UIImage.init(named: "female")!)
    ]
    
    private var genders = ["male", "female"]
    
    func getGenders() -> Array<String> {
        return genders
    }
    
    func getContacts() -> Array<Contact>{
        return contacts
    }
    
    mutating func addNewContact(_ contact: Contact){
        contacts.append(contact)
    }
    
    mutating func deleteContact(_ index: Int){
        contacts.remove(at: index)
    }
}
