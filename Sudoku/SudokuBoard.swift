//
//  SudokuBoard.swift
//  Sudoku
//
//  Created by Lindberg on 3/12/18.
//  Copyright © 2018 Lindberg. All rights reserved.
//

import Foundation

class SudokuBoard {
    var board: [[Int]] = [
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
    ]
    
    func numberAt(row: Int, column: Int) -> Int {
        return self.board[row][column]
    }
    
    func numberIsFixedAt(row: Int, column: Int) -> Bool {
        return true
    }
    
    func isConflictingEntryAt(row: Int, column: Int) -> Bool {
        return false
    }
    
    func anyPencilSetAt(row: Int, column: Int) -> Bool {
        return false
    }
    
    func isSetPencil(_ n: Int, row: Int, column: Int) -> Bool {
        return false
    }
}
