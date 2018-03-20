//
//  MainViewController.swift
//  Sudoku
//
//  Created by Lindberg on 3/20/18.
//  Copyright © 2018 Lindberg. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func myUnwindFunction(unwindSegue: UIStoryboardSegue) {
        // Does nothing
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "simpleGame"?:
            let puzzle = appDelegate.selectRandomPuzzle(puzzles: appDelegate.simplePuzzles)
            appDelegate.sudoku = SudokuBoard(puzzle: puzzle)
        case "hardGame"?:
            let puzzle = appDelegate.selectRandomPuzzle(puzzles: appDelegate.hardPuzzles)
            appDelegate.sudoku = SudokuBoard(puzzle: puzzle)
        default:
            print("Unable to get puzzle!")
        }
    }
}
