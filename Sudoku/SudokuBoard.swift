//
//  SudokuBoard.swift
//  Sudoku
//
//  Created by Lindberg on 3/12/18.
//  Copyright © 2018 Lindberg. All rights reserved.
//

import Foundation

struct Cell {
    var value: Int
    var isFixed: Bool
    var isPenciledIn: Bool
    
    init(value: Int, isFixed: Bool, isPenciledIn: Bool) {
        self.value = value
        self.isFixed = isFixed
        self.isPenciledIn = isPenciledIn
    }
}

class SudokuBoard {
    
    var board: [[Cell]] = Array(repeating: Array(repeating: Cell(value: 0, isFixed: true, isPenciledIn: false), count: 9), count: 9)
    
    var selected = (-1, -1)
    
    init(simplePuzzle: String) {
        var r = 0
        var c = 0
        
        for char in simplePuzzle {
            if c == 9 {
                r += 1
                c = 0
            }
            if let value = Int(String(char)) {
                self.board[r][c] = Cell(value: value, isFixed: true, isPenciledIn: false)
            }
            else {
                self.board[r][c] = Cell(value: 0, isFixed: false, isPenciledIn: false)
            }
            c += 1
        }
    }
    
    func clearNumberAt(row: Int, column: Int) {
        self.board[row][column].value = 0
        self.board[row][column].isPenciledIn = false
    }
    
    func clearBoard() {
        for r in 0 ..< 9 {
            for c in 0 ..< 9 {
                if self.anyPencilSetAt(row: r, column: c) {
                    self.clearNumberAt(row: r, column: c)
                }
            }
        }
    }
    
    func setNumberAt(row: Int, column: Int, value: Int) {
        self.board[row][column].value = value
        self.board[row][column].isPenciledIn = true
    }
    
    func numberAt(row: Int, column: Int) -> Int {
        return self.board[row][column].value
    }
    
    func numberIsFixedAt(row: Int, column: Int) -> Bool {
        return self.board[row][column].isFixed
    }
    
    func isConflictingEntryAt(row: Int, column: Int) -> Bool {
        return false
    }
    
    func anyPencilSetAt(row: Int, column: Int) -> Bool {
        return self.board[row][column].isPenciledIn
    }
    
    func isSetPencil(_ n: Int, row: Int, column: Int) -> Bool {
        return self.anyPencilSetAt(row: row, column: column) && self.board[row][column].value == n
    }
}
