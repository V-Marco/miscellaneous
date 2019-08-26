//
//  ViewController.swift
//  snakesAndLadders
//
//  Created by Vladimir Omelyusik on 08/08/2019.
//  Copyright © 2019 Vladimir Omelyusik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var gameFieldView: UIView!
    @IBOutlet weak var diceButton: UIButton!
    @IBOutlet weak var diceResultLabel: UILabel!
    @IBOutlet weak var aiView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    
    // array to store generated coordinates
    var coords: (Array<Double>, Array<Double>) = ([0], [0])
    var initialPosition = CGPoint()
    
    // array to store start-end coordinates of snakes-ladders
    let snakes_ladders: [Int: Int] = [7: 21, 91: 64]
    
    // players
    var player = Player()
    var ai_player = Player()
    
    // to store whose turn it is
    var turn_blue = Bool() // true if blue's turn, false if red's turn
    
    // connect everything
    override func viewDidLoad() {
        super.viewDidLoad()
        // blue rolls first
        turn_blue = true
        // generate grid (and check)
        coords = genTenTenGrid(fromView: self.gameFieldView)
        print(coords)
        // initialize players
        player.playerView = self.playerView
        ai_player.playerView = self.aiView
        initialPosition = self.playerView.bounds.origin
    }
    
    // animates the correct movement of a player's view verically and horizontally
    func move(view: UIView, fromCell from: Int, toCell cell: Int) {
        self.diceButton.isEnabled = false
        if cell < 100 {
            // check if there are bounds on the way
            if from / 10 == cell / 10 {
                // if the cells are on the same row, just move the player
                UIView.animate(withDuration: 0.3, animations: {
                    view.bounds.origin = getGridCoordinateFromCellNumber(cellNumber: cell, coordinates: self.coords)
                }) {(success: Bool) in
                    if self.snakes_ladders[cell] != nil {
                        self.moveByLadder(view: view, fromCell: cell)
                    } else {
                        self.diceButton.isEnabled = true
                    }
                }
            } else {
                // if the cells are on the different rows, move the player to the end of the first row, one cell up
                // and to the final cell on the second row
                UIView.animate(withDuration: 0.3, animations: {
                    view.bounds.origin = getGridCoordinateFromCellNumber(cellNumber: (from / 10)*10 + 9, coordinates: self.coords)
                }) { (success: Bool) in
                    UIView.animate(withDuration: 0.3, animations: {
                        view.bounds.origin = getGridCoordinateFromCellNumber(cellNumber: (from / 10)*10 + 9 + 1, coordinates: self.coords)
                    }) { (success: Bool) in
                        UIView.animate(withDuration: 0.3, animations: {
                            view.bounds.origin = getGridCoordinateFromCellNumber(cellNumber: cell, coordinates: self.coords)
                        }) {(success: Bool) in
                            if self.snakes_ladders[cell] != nil {
                                self.moveByLadder(view: view, fromCell: cell)
                            } else {
                                self.diceButton.isEnabled = true
                            }
                        }
                    }
                }
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                view.bounds.origin = getGridCoordinateFromCellNumber(cellNumber: 99, coordinates: self.coords)
            }) {(success: Bool) in
                self.diceButton.isEnabled = false
                if view == self.player.playerView {
                    self.infoLabel.textColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
                    self.infoLabel.text = "Blue Won!"
                } else {
                    self.infoLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                    self.infoLabel.text = "Red Won!"
                }
            }
            
        }
    }
    
    // animates the correct movement of a player's view through the snakes and ladders
    func moveByLadder(view: UIView, fromCell cell: Int) {
        UIView.animate(withDuration: 0.3, animations: {
            view.bounds.origin = getGridCoordinateFromCellNumber(cellNumber: self.snakes_ladders[cell]!, coordinates: self.coords)
        }) { (success: Bool) in
            self.diceButton.isEnabled = true
            if view == self.player.playerView {
                self.player.currentPosition = self.snakes_ladders[cell]!
            } else {
                self.ai_player.currentPosition = self.snakes_ladders[cell]!
            }
        }
    }
    
    // restarts the game and resets to the initial values
    func resetAll() {
        self.diceButton.isEnabled = true
        self.aiView.bounds.origin = self.initialPosition
        self.playerView.bounds.origin = self.initialPosition
        self.infoLabel.textColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
        self.infoLabel.text = "Blue's Turn"
        player.currentPosition = 0
        ai_player.currentPosition = 0
    }
    
    
    // IBActions
    @IBAction func roll(_ sender: UIButton) {
        let dicePoints = Int.random(in: 1...6)
        self.diceResultLabel.text = "\(dicePoints)"
        
        if self.turn_blue == true {
            let old_pos = self.player.currentPosition
            self.player.currentPosition += dicePoints
            self.move(view: player.playerView, fromCell: old_pos, toCell: player.currentPosition)
            self.infoLabel.text = "Red's Turn"
            self.infoLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            self.turn_blue = false
        } else {
            let old_pos = self.ai_player.currentPosition
            self.ai_player.currentPosition += dicePoints
            self.move(view: ai_player.playerView, fromCell: old_pos, toCell: ai_player.currentPosition)
            self.infoLabel.text = "Blue's Turn"
            self.infoLabel.textColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
            self.turn_blue = true
        }
        
    }
    
    @IBAction func restart_game(_ sender: UIButton) {
        self.resetAll()
    }
}
