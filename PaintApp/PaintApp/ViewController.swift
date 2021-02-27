//
//  ViewController.swift
//  PaintApp
//
//  Created by Асыланбек Нурмухамбет on 2/20/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var items: [UIColor] = [UIColor.red, UIColor.black, UIColor.green, UIColor.blue]
    var figures = [ "circle", "line", "pen", "rectangle", "triangle"]

    @IBOutlet weak var figuresCollection: UICollectionView!
    @IBOutlet weak var customCanvas: UIView!
    @IBOutlet weak var colorsCollection: UICollectionView!
    @IBOutlet weak var switchFill: UISwitch!
    @IBOutlet weak var undoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        self.undoButton.addGestureRecognizer(tapGesture)
        self.undoButton.addGestureRecognizer(longGesture)
        self.switchFill.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
    }

    @objc func stateChanged(switchState: UISwitch) {
        if switchState.isOn {
            fillMode = true
        } else {
            fillMode = false
        }
    }
    
    @objc func tap() {
        figureType = FigureType.Undo
        customCanvas.setNeedsDisplay()
    }
    
    @objc func longPressed()
    {
        figureType = FigureType.Clear
        customCanvas.setNeedsDisplay()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var number = 0
        switch(collectionView) {
        case colorsCollection:
            number = items.count
        case figuresCollection:
            number = figures.count
        default: break
        }
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        switch (collectionView) {
        case (colorsCollection):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath)
            
            if let view = cell.viewWithTag(111){
                view.backgroundColor = items[indexPath.row]
                view.layer.cornerRadius = 3
            }
            return cell
            
        case (figuresCollection):
            let newCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "figureCell", for: indexPath) as? FigureCollectionCollectionViewCell)!
            newCell.imageFigure.image = UIImage(named: figures[indexPath.row])
            cell = newCell as UICollectionViewCell
            return cell
            
        default:
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == figuresCollection {
            switch figures[indexPath.row] {
            case "circle":
                figureType = FigureType.Circle
            case "rectangle":
                figureType = FigureType.Rectangle
            case "line":
                figureType = FigureType.Line
            case "triangle":
                figureType = FigureType.Triangle
            case "pen":
                figureType = FigureType.Pen
            default:
                break
            }
        }
        else if collectionView == colorsCollection {
            switch items[indexPath.row] {
            case UIColor.red:
                colorType = ColorType.redColor
            case UIColor.black:
                colorType = ColorType.blackColor
            case UIColor.green:
                colorType = ColorType.greenColor
            case UIColor.blue:
                colorType = ColorType.blueColor
            default:
                break
            }
        }
    }
}
