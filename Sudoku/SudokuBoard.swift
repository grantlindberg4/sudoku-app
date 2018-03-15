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
    
    func entryConflictInRow(row: Int) -> Bool {
        for value in 1 ..< 9 {
            for c in 0 ..< 9 {
                if self.selected == (row, c) {
                    continue
                }
                if self.numberAt(row: row, column: c) == value {
                    return true
                }
            }
        }
        
        return false
    }
    
    func entryConflictInColumn(column: Int) -> Bool {
        for value in 1 ..< 9 {
            for r in 0 ..< 9 {
                if self.selected == (r, column) {
                    continue
                }
                if self.numberAt(row: r, column: column) == value {
                    return true
                }
            }
        }
        
        return false
    }
    
    func entryConflictInGrid(row: Int, column: Int) -> Bool {
        for value in 1 ..< 9 {
            for r in row-2 ..< row+2 {
                if r < 0 || r >= 9 {
                    continue
                }
                for c in column-2 ..< column+2 {
                    if c < 0 || c >= 9 {
                        continue
                    }
                    
                    if self.selected == (r, c) {
                        continue
                    }
                    
                    if self.numberAt(row: r, column: c) == value {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    func isConflictingEntryAt(row: Int, column: Int) -> Bool {
        return self.entryConflictInRow(row: row) ||
               self.entryConflictInColumn(column: column) ||
               self.entryConflictInGrid(row: row, column: column)
    }
    
    func anyPencilSetAt(row: Int, column: Int) -> Bool {
        return self.board[row][column].isPenciledIn
    }
    
    func isSetPencil(_ n: Int, row: Int, column: Int) -> Bool {
        return self.anyPencilSetAt(row: row, column: column) && self.board[row][column].value == n
    }
}
