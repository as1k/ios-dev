//
//  PaintModel.swift
//  PaintApp
//
//  Created by Асыланбек Нурмухамбет on 2/26/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

var paintModel = PaintModel()

var fillMode = false
var figureType = FigureType.Circle
var colorType = ColorType.blackColor
enum FigureType {
    case Undo
    case Clear
    case Circle
    case Line
    case Pen
    case Rectangle
    case Triangle
}

enum ColorType {
    case redColor
    case blackColor
    case greenColor
    case blueColor
}

struct PaintModel{
    var figureList = [Figure]()
    
    mutating func addFigure(drawing: Figure){
        figureList.append(drawing)
    }
    
    mutating func deleteFigures(){
        figureList.removeAll()
    }
    
    func getFigureList() -> [Figure]{
        return figureList
    }
    
    mutating func undo()
    {
        figureList.removeLast()
    }
}
