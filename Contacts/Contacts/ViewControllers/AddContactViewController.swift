//
//  AddContactViewController.swift
//  Contacts
//
//  Created by Асыланбек Нурмухамбет on 2/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var actionsProtocol: ActionsProtocol?
    var genders = Array<String>()
    var choosenGender: String?
    
    @IBOutlet weak var nameSurnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var genderPickerView: UIPickerView!
    @IBAction func savePressed(_ sender: UIButton) {
        actionsProtocol?.addContact(
            nameSurname: nameSurnameTextField.text!,
            phoneNumber: phoneTextField.text!,
            gender: choosenGender!
        )
        navigationController?.popViewController(animated: true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        choosenGender = genders[row]
        return genders[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderPickerView.center = view.center
        genderPickerView.dataSource = self
        genderPickerView.delegate = self
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
