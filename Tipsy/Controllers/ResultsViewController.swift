//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mauricio Dias on 17/3/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var billValue = ""
    var percent  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = billValue
        settingsLabel.text = "Split between 2 people, with \(percent)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
