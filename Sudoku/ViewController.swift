//
//  ViewController.swift
//  Sudoku
//
//  Created by Lindberg on 3/1/18.
//  Copyright © 2018 Lindberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var pencilEnabled: Bool = false
    
    @IBAction func pencilPressed(_ sender: UIButton) {
        pencilEnabled = !pencilEnabled
        sender.isSelected = pencilEnabled
    }
}
