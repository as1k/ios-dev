//
//  ViewController.swift
//  AnimationExampleApp
//
//  Created by Асыланбек Нурмухамбет on 4/1/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var field1: UITextField!
    @IBOutlet weak var field2: UITextField!
    var xPosStart1: CGFloat?
    var xPosStart2 : CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBordersToButton(button: nextButton)
        xPosStart1 = field1.center.x
        xPosStart2 = field2.center.x
        
        animateTextField(textField: field1, duration: 1)
        animateTextField(textField: field2, duration: 1)
        animateButtonAlpha(button: self.nextButton)
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        let options: UIView.AnimationOptions = [.curveEaseOut]
        UIView.animate(withDuration:2, delay: 0, options: options, animations: {
            self.field1.center = CGPoint(x: self.xPosStart1!, y: self.field1.center.y)
            self.field2.center = CGPoint(x: self.xPosStart2! + self.field2.bounds.width, y: self.field2.center.y)
        }, completion: { (Bool) in
            self.animateButtonAlpha(button: self.nextButton)
            self.performSegue(withIdentifier: "mySegue", sender: nil)
        })
    }
    
    func addBordersToButton(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
    }
    
    func animateButtonAlpha(button: UIButton) {
        if (button.alpha < 1) {
            UIView.animate(
                withDuration: 1,
                animations: {
                    button.alpha = 1
            })
        } else {
            UIView.animate(
                withDuration: 1,
                animations: {
                    button.alpha = 0
            })
        }
    }
    
    func animateTextField(textField: UITextField, duration: Double) {
        let options: UIView.AnimationOptions = [.curveEaseOut]
        UIView.animate(withDuration:1, delay: 0, options: options, animations: {
            textField.center = CGPoint(
                x: textField.bounds.width,
                y: textField.center.y
            )
        })
    }
}
