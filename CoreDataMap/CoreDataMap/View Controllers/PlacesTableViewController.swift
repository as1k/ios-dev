//
//  PlacesTableViewController.swift
//  CoreDataMap
//
//  Created by Асыланбек Нурмухамбет on 3/27/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit
import CoreData

class PlacesTableViewController: UITableViewController {
    var deleteDelegate: DeleteDelegate?
    var switchAnnotationDelegate: SwitchAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPlaces()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = places[indexPath.row].name!
        cell.detailTextLabel?.text = places[indexPath.row].desc!
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switchAnnotationDelegate?.switchOpenedAnnotation(
            places[indexPath.row].name!,
            places[indexPath.row].desc!
        )
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        deleteDelegate?.deletePlace(
            places[indexPath.row].name!,
            places[indexPath.row].desc!
        )
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
                let context = appDelegate.persistentContainer.viewContext
                if editingStyle == .delete {
                    context.delete(places[indexPath.row])
                    do {
                        try context.save()
                    } catch {}
                    
                }
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
                do {
                    places = try context.fetch(fetchRequest) as! [NSManagedObject] as! [Place]
                } catch {}
                
                tableView.reloadData()
            }
        }
    }
}
