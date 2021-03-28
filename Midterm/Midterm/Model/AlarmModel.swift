//
//  AlarmModel.swift
//  Midterm
//
//  Created by Асыланбек Нурмухамбет on 3/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

class AlarmModel {
    
    var alarms: [Alarm] = [
        Alarm.init("8:00", "Job", true),
        Alarm.init("12:00", "Lunch", true),
        Alarm.init("17:00", "Dinner", false),
        Alarm.init("21:00", "Football", true)
    ]

    func getContactListLength() -> Int {
        return alarms.count
    }

    func getCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.timeUILabel.text = alarms[indexPath.row].time
        cell?.notesUILabel.text = alarms[indexPath.row].notes
        cell?.switchButton.isOn = alarms[indexPath.row].isSwitchOn
        return cell!
    }

    func getAlarm(_ index: Int) -> Alarm? {
        if alarms.count > index {
            return alarms[index]
        }
        return nil
    }

    func addAlarm(alarm: Alarm) {
        alarms.append(alarm)
    }

    func removeAlarm(_ index: Int) {
        alarms.remove(at: index)
    }
    
    func changeAlarm(at index: Int, to alarm: Alarm) {
        alarms[index] = alarm
    }
}
