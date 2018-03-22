//
//  ViewController.swift
//  Sudoku
//
//  Created by Lindberg on 3/1/18.
//  Copyright © 2018 Lindberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var sudokuView: SudokuView!
    
    var pencilEnabled: Bool = false
    
    @IBAction func pencilPressed(_ sender: UIButton) {
        pencilEnabled = !pencilEnabled
        sender.isSelected = pencilEnabled
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        if !pencilEnabled {
            return
        }
        let value = sender.tag
        let puzzle = appDelegate.sudoku
        
        let r = sudokuView.selected.row
        let c = sudokuView.selected.column
        
        if r != -1 && c != -1 {
            if puzzle!.anyPencilSetAt(row: r, column: c) {
                if puzzle!.isSetPencil(value, row: r, column: c) {
                    puzzle?.clearNumberAt(row: r, column: c)
                }
            }
            else {
                puzzle?.setNumberAt(row: r, column: c, value: value)
            }
        }
        
        sudokuView.setNeedsDisplay()
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        let puzzle = appDelegate.sudoku
        puzzle!.clearBoard()
        sudokuView.setNeedsDisplay()
    }


    @IBAction func leavePuzzleButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Leave game",
                                      message: """
                                                    Are you sure you wish to leave the game?
                                                    All progress will be lost
                                               """,
                                      preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Confirm", style: .default) { (action) in
            self.performSegue(withIdentifier: "unwindToMainMenu", sender: self)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
}

