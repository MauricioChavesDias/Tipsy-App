//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var stepperNumberPeople: UIStepper!
    
    var tipsyBrain  = TipsyBrain()
    var billValue : Float = 0.0
    var numberPeople: Int = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        
        sender.isSelected = true
    }
 
    func getPercentChosenByUser() -> Float{
        var percent : Float = 0.0
        if twentyPercentButton.isSelected {
            percent = 0.20
        } else if tenPercentButton.isSelected {
            percent = 0.10
        } else {
            percent = 0.0
        }
        return percent
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != "" {
            let percentChosen = getPercentChosenByUser()
            let billValue     = Float(billTextField.text!)!
            let numberPeople  = Int(stepperNumberPeople.value)
            tipsyBrain.calculateTips(value: billValue, nroPeople: numberPeople, perc: percentChosen)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billValue = String(format: "%.2f", tipsyBrain.getResult())
            destinationVC.percent  = String(Int(tipsyBrain.getPerc()*100))
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }

    
}

