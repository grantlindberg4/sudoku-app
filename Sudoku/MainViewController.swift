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
    
    @IBAction func unwindToMainMenu(unwindSegue: UIStoryboardSegue) {
        // Return to main menu
    }
    
    @IBAction func simpleGameButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "New simple game",
                                      message: """
                                                    Are you sure you wish to start a new game?
                                                    Previous progress will be overwritten
                                               """,
                                      preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Confirm", style: .default) { (action) in
            let puzzle = self.appDelegate.selectRandomPuzzle(puzzles: self.appDelegate.simplePuzzles)
            self.appDelegate.sudoku = SudokuBoard(puzzle: puzzle)
            self.performSegue(withIdentifier: "toGame", sender: action)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func hardGameButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "New hard game",
                                      message: """
                                                    Are you sure you wish to start a new game?
                                                    Previous progress will be overwritten
                                               """,
                                      preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Confirm", style: .default) { (action) in
            let puzzle = self.appDelegate.selectRandomPuzzle(puzzles: self.appDelegate.hardPuzzles)
            self.appDelegate.sudoku = SudokuBoard(puzzle: puzzle)
            self.performSegue(withIdentifier: "toGame", sender: action)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
}
