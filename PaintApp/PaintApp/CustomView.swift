//
//  CustomView.swift
//  PaintApp
//
//  Created by Асыланбек Нурмухамбет on 2/20/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var point1: CGPoint?
    var point2: CGPoint!
    var points = [CGPoint]()
    
    var color: Dictionary<ColorType, UIColor> = [
        ColorType.redColor: .red,
        ColorType.blackColor: .black,
        ColorType.greenColor: .green,
        ColorType.blueColor: .blue
    ]
    
    override func draw(_ rect: CGRect) {
        switch figureType{
        case FigureType.Rectangle:
            if let p1 = point1{
                let rect: Figure = Rectangle( withSome: color[colorType]!, and: 3, isFilled: fillMode, with: p1, and: point2)
                rect.draw()
                paintModel.addFigure(drawing: rect)
            }
        case FigureType.Circle:
            if let p1 = point1{
                let circ: Figure = Circle(withSome: color[colorType]!, and: 3, isFilled: fillMode, with: point2.x-p1.x, and: point2)
                circ.draw()
                paintModel.addFigure(drawing: circ)
            }
        case FigureType.Line:
            if let p1 = point1{
                let line: Figure = Line(withSome: color[colorType]!, and: 3, isFilled: fillMode, with: p1, and: point2)
                line.draw()
                paintModel.addFigure(drawing: line)
            }
        case FigureType.Triangle:
            if let p1 = point1{
                let triangle: Figure = Triangle(withSome: color[colorType]!, and: 3, isFilled: fillMode, with: p1, and: point2)
                triangle.draw()
                paintModel.addFigure(drawing: triangle)
            }
        case FigureType.Pen:
            let pen: Figure = Pen( withSome: color[colorType]!, and: 3, isFilled: fillMode, with: points)
            pen.draw()
            paintModel.addFigure(drawing: pen)
            points = [CGPoint]()
        case FigureType.Undo:
            point1 = nil
            point2 = nil
            paintModel.undo()
            switch paintModel.getFigureList().last {
            case is Circle:
                figureType = FigureType.Circle
            case is Rectangle:
                figureType = FigureType.Rectangle
            case is Line:
                figureType = FigureType.Line
            case is Pen:
                figureType = FigureType.Pen
            case is Triangle:
                figureType = FigureType.Triangle
            default:
                break
            }
        case FigureType.Clear:
            paintModel.deleteFigures()
            figureType = FigureType.Circle
        }
        
        for figure in paintModel.getFigureList() {
            figure.draw()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch =  touches.first{
            if figureType == FigureType.Pen
            {
                points.append(touch.location(in: self))
            }
            else{
                point1 = touch.location(in: self)
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if figureType == FigureType.Pen{
            guard let touch = touches.first?.location(in: self)  else
            {return}
            points.append(touch)
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch =  touches.first{
            point2 = touch.location(in: self)
            if figureType == FigureType.Pen{
                points.append(point2)
            }
        }
        
        setNeedsDisplay()
    }
}
