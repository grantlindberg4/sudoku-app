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
    
    init(simplePuzzle: String) {
        var r = 0
        var c = 0
        
        for char in simplePuzzle {
            if c == 9 {
                r += 1
                c = 0
            }
            if let value = Int(String(char)) {
                self.board[r][c] = value
            }
            else {
                self.board[r][c] = 0
            }
            c += 1
        }
    }
    
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
