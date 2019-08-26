//
//  Player.swift
//  snakesAndLadders
//
//  Created by Vladimir Omelyusik on 26/08/2019.
//  Copyright © 2019 Vladimir Omelyusik. All rights reserved.
//

import UIKit

struct Player {
    var currentPosition = 0
    var playerView = UIView()
    
    // for possible future use
    mutating func updatePosition(to cell: Int) -> Int {
        let old_position = currentPosition
        currentPosition = cell
        return old_position
    }
}
