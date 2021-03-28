//
//  TableViewController.swift
//  Midterm
//
//  Created by Асыланбек Нурмухамбет on 3/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class EditAlarmViewController: UIViewController {

    var alarmId: Int?
    var alarm: Alarm?
    var timeAsString: String?
    var changeDelegate: ChangeAlarmDelegate?
    var deleteDelegate: DeleteAlarmDelegate?
    
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var editText: UITextField!
    
    
    @IBAction func deleteClicked(_ sender: UIButton) {
        deleteDelegate?.deleteAlarmByDelegate(index: alarmId ?? 1)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeClicked(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"

        let dateAsString = formatter.string(from: picker.date)
        changeDelegate?.changeAlarmByDelegate(index: alarmId!, alarm: Alarm.init(dateAsString, editText?.text ?? "", true))
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        let date = dateFormatter.date(from: (alarm?.time)!)
        picker.date = date!
        editText.text = alarm?.notes
        // Do any additional setup after loading the view.
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
