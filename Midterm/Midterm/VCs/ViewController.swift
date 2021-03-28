//
//  ViewController.swift
//  Midterm
//
//  Created by Асыланбек Нурмухамбет on 3/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var model = AlarmModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getContactListLength()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        model.getCell(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            model.removeAlarm(indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewAlarmViewController {
            destination.addDelegate = self
        }
        if let destination = segue.destination as? EditAlarmViewController {
            let index = (tableView.indexPathForSelectedRow?.row)!
            destination.alarmId = index
            destination.alarm = model.alarms[index]
            destination.deleteDelegate = self
            destination.changeDelegate = self
        }
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        
    }
    
}

extension ViewController: AddAlarmDelegate, DeleteAlarmDelegate, ChangeAlarmDelegate {
    func addAlarmByDelegate(alarm: Alarm) {
        model.addAlarm(alarm: alarm)
        tableView.reloadData()
    }
    
    func deleteAlarmByDelegate(index: Int) {
        model.removeAlarm(index)
        tableView.reloadData()
    }
    
    func changeAlarmByDelegate(index: Int, alarm: Alarm) {
        model.changeAlarm(at: index, to: alarm)
        tableView.reloadData()
    }
}
