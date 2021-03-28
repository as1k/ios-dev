//
//  EditViewController.swift
//  CoreDataMap
//
//  Created by Асыланбек Нурмухамбет on 3/27/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class EditViewController: UIViewController {
    
    var desc:String?
    var name:String?
    var updateDelegate: UpdateDelegate?
    
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descTextField.text = desc ?? ""
        nameTextField.text = name ?? ""
    }
    
    @IBAction func saveClicked(_ sender: UIButton) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Place")
            let namePredicate = NSPredicate(format: "name = %@", name!)
            let descPredicate = NSPredicate(format: "desc = %@", desc!)
            let compoundPredicate = NSCompoundPredicate(
                type: NSCompoundPredicate.LogicalType.and,
                subpredicates: [namePredicate, descPredicate]
            )
            fetchRequest.predicate = compoundPredicate
            
            do {
                let test = try context.fetch(fetchRequest)
                let objectUpdate = test[0] as! NSManagedObject
                objectUpdate.setValue(nameTextField.text!, forKey: "name")
                objectUpdate.setValue(descTextField.text!, forKey: "desc")
                do {
                    try context.save()
                } catch {}
            } catch {}
            updateDelegate?.updatePlace()
            navigationController?.popViewController(animated: true)
        }
    }
    func loadPlaces()->[Place]{
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<Place>(entityName: "Place")
            do {
                try places = context.fetch(fetchRequest)
            } catch{}
        }
        return places
    }
}
