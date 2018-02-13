//
//  ViewController.swift
//  SingelViewApp
//
//  Created by Mate Szlanka on 2018. 02. 13..
//  Copyright © 2018. mateszlanka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorChangeButton: UIButton!
    
    var isDefaultColor: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func changeColorTouched(_ sender: UIButton) {
        self.view.backgroundColor = isDefaultColor ? .yellow : .white
        isDefaultColor = !isDefaultColor
    }
}

