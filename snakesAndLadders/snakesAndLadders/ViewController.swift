//
//  ViewController.swift
//  snakesAndLadders
//
//  Created by Vladimir Omelyusik on 08/08/2019.
//  Copyright © 2019 Vladimir Omelyusik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var gameFieldView: UIView!
    @IBOutlet weak var diceButton: UIButton!
    @IBOutlet weak var diceResultLabel: UILabel!
    
    var moves = Array(repeating: 0, count: 100)
    var coords: (Array<Double>, Array<Double>) = ([0], [0])
    
    var player = Player()
    
    var initialPosition = CGPoint()

    override func viewDidLoad() {
        super.viewDidLoad()
        coords = genTenTenGrid(fromView: self.gameFieldView)
        player.playerView = self.playerView
        initialPosition = self.playerView.bounds.origin
        print(coords)
    }
    
    func move(view: UIView, fromCell from: Int, toCell cell: Int) {
        self.diceButton.isEnabled = false
        if cell < 100 {
            // check if there are bounds on the way
            if from / 10 == cell / 10 {
                UIView.animate(withDuration: 0.3, animations: {
                    view.bounds.origin = self.getGridCoordinateFromCellNumber(cellNumber: cell, coordinates: self.coords)
                }) {(success: Bool) in
                    self.diceButton.isEnabled = true
                }
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    view.bounds.origin = self.getGridCoordinateFromCellNumber(cellNumber: (from / 10)*10 + 9, coordinates: self.coords)
                }) { (success: Bool) in
                    UIView.animate(withDuration: 0.3, animations: {
                        view.bounds.origin = self.getGridCoordinateFromCellNumber(cellNumber: (from / 10)*10 + 9 + 1, coordinates: self.coords)
                    }) { (success: Bool) in
                        UIView.animate(withDuration: 0.3, animations: {
                            view.bounds.origin = self.getGridCoordinateFromCellNumber(cellNumber: cell, coordinates: self.coords)
                        }) {(success: Bool) in
                            self.diceButton.isEnabled = true
                        }
                    }
                }
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                view.bounds.origin = self.getGridCoordinateFromCellNumber(cellNumber: 99, coordinates: self.coords)
            }) {(success: Bool) in
                self.diceButton.isEnabled = true
                self.setVictory()
            }
            
        }
    }
    
    func setVictory() {
        self.playerView.bounds.origin = self.initialPosition
        player.currentPosition = 0
    }
    
    func getGridCoordinateFromCellNumber(cellNumber: Int, coordinates: (Array<Double>, Array<Double>)) -> CGPoint {
        let row = cellNumber / coordinates.0.count
        var column = cellNumber - coordinates.0.count * row
        if row % 2 != 0 {
            column = coordinates.0.count - 1 - column
        }
        return CGPoint(x: coordinates.0[column], y: coordinates.1[row])
    }
    
    
    @IBAction func roll(_ sender: UIButton) {
        let dicePoints = Int.random(in: 1...6)
        self.diceResultLabel.text = "Dice: \(dicePoints)"
        let old_pos = player.updatePosition(to: player.currentPosition + dicePoints)
        self.move(view: player.playerView, fromCell: old_pos, toCell: player.currentPosition)
    }
    
}

struct Player {
    var currentPosition = 0
    let name = "Player"
    var playerView = UIView()
    
    mutating func updatePosition(to cell: Int) -> Int {
        let old_position = currentPosition
        currentPosition = cell
        return old_position
    }
}

func genTenTenGrid(fromView view: UIView) -> (Array<Double>, Array<Double>) {
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
