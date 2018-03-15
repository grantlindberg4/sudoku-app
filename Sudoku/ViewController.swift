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
        let value = sender.tag
        let puzzle = appDelegate.sudoku
        
        let r = puzzle!.selected.0
        let c = puzzle!.selected.1
        
        if r != -1 && c != -1 {
            if puzzle!.anyPencilSetAt(row: r, column: c) {
                if puzzle!.isSetPencil(value, row: r, column: c) {
                    puzzle?.clearNumberAt(row: r, column: c)
                }
            }
            else {
                puzzle?.setNumberAt(row: r, column: c, value: value)
            }
            
            puzzle?.selected = (-1, -1)
            sudokuView.setNeedsDisplay()
        }
    }
}
