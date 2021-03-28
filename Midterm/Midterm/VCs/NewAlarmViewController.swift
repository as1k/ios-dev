//
//  NewAlarmViewController.swift
//  Midterm
//
//  Created by Асыланбек Нурмухамбет on 3/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class NewAlarmViewController: UIViewController {

    var timeAsString: String?
    var addDelegate: AddAlarmDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var editText: UITextField!
    
    @IBAction func saveClicked(_ sender: UIButton) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let time = timeFormatter.string(from: datePicker.date)
        
        addDelegate?.addAlarmByDelegate(alarm: Alarm.init(time, editText?.text ?? "", true))
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
