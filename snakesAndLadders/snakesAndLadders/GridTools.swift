//
//  GridTools.swift
//  snakesAndLadders
//
//  Created by Vladimir Omelyusik on 26/08/2019.
//  Copyright © 2019 Vladimir Omelyusik. All rights reserved.
//

import UIKit

func genTenTenGrid(fromView view: UIView) -> (Array<Double>, Array<Double>) {
    // generates 10x10 grid placed on a view's bounds
    // returns a tuple with two arrays: with x coordinates (first) and y coordinates (second)
    // of a top-left corner of the grid's cells
    let width = view.bounds.size.width
    let height = view.bounds.size.height
    
    let lowerRightPoint = CGPoint(x: view.bounds.origin.x + width,
                                  y: view.bounds.origin.y + height)
    
    let cellWidth = width / 10
    let cellHeight = height / 10
    
    // get x-s
    var xs = [Double]()
    var i = lowerRightPoint.x
    repeat {
        xs.append(Double(i - cellWidth))
        i -= cellWidth
    } while i > lowerRightPoint.x - width
    
    // get y-s
    var ys = [Double]()
    var j = lowerRightPoint.y
    repeat {
        ys.append(Double(j - cellHeight))
        j -= cellWidth
    } while j > lowerRightPoint.y - height
    
    return (xs.reversed(), ys.reversed())
}

func getGridCoordinateFromCellNumber(cellNumber: Int, coordinates: (Array<Double>, Array<Double>)) -> CGPoint {
    // returns the coordinates for cell of a given number (in a 10x10 grid the cells are number 0-99 with
    // 0-9 in the first row (from right to left),
    // 10-19 in the second row (from left to right),
    // 20-29 in the third row (from right to left) and so on.
    let row = cellNumber / coordinates.0.count
    var column = cellNumber - coordinates.0.count * row
    if row % 2 != 0 {
        column = coordinates.0.count - 1 - column
    }
    return CGPoint(x: coordinates.0[column], y: coordinates.1[row])
}
