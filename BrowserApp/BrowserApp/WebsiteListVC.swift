//
//  BrowserViewControllerTableViewController.swift
//  BrowserApp
//
//  Created by Асыланбек Нурмухамбет on 2/24/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

var websites: [Website] = [
       Website(title: "YouTube", link: "https://www.youtube.com"),
       Website(title: "Facebook", link: "https://www.facebook.com"),
       Website(title: "Google", link: "https://www.google.com")
   ]
var favWebsites: [Website] = [Website]()
var totalWebsites = [websites, favWebsites]

let LIST_TABLE_VIEW_ID = 0
let FAVORITES_TABLE_VIEW_ID = 1
let MASTER_UPDATED = "masterUpdated"

class WebsiteListVC: UITableViewController {

    private let openInfoSegueID = "openWebsite"
    private var currentTableViewID: Int = LIST_TABLE_VIEW_ID
    
    @IBAction func segmentSwitched(_ sender: UISegmentedControl) {
        currentTableViewID = sender.selectedSegmentIndex
        self.tableView.reloadData()
    }
    
    @IBAction func addWebsite(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(
            title: "Add Website",
            message: "Fill all the fields",
            preferredStyle: .alert
        )
        alertController.addTextField()
        alertController.addTextField()

        let action = UIAlertAction(title: "Add",style: .default) { UIAlertAction in
            NSLog("Add Pressed")
            let title = alertController.textFields?[0].text
            let link = alertController.textFields?[1].text
            totalWebsites[LIST_TABLE_VIEW_ID].append(Website(title: title, link: link))
            self.tableView.reloadData()
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Websites"
        currentTableViewID = LIST_TABLE_VIEW_ID
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.updateMaster),
            name: NSNotification.Name(rawValue: MASTER_UPDATED),
            object: nil
        )
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalWebsites[currentTableViewID].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "websiteCell", for: indexPath)
        cell.textLabel?.text = totalWebsites[currentTableViewID][indexPath.row].title
        return cell
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == openInfoSegueID {
            if let navController = segue.destination as? UINavigationController {
                if let destination = navController.visibleViewController as? InfoVC {
                    if let cellIndex = self.tableView.indexPathForSelectedRow?.row {
                        let currentWebsite = totalWebsites[currentTableViewID][cellIndex]
                        destination.link = currentWebsite.link
                        destination.navigationItem.title = currentWebsite.title
                        destination.openedWebsite = currentWebsite
                        destination.id = cellIndex
                    }
                }
            }
        }
    }
    
    @objc func updateMaster() {
        self.tableView.reloadData()
    }
}
