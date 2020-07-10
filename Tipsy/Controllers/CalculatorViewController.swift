//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tip : Double = 10.0
    var numberOfPeople : Double = 2.0
    var billAmount : Double = 0
    var finalResult : Double = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercent = String(buttonTitle.dropLast())
        let buttonTitleNum = Double(buttonTitleMinusPercent)
        tip = buttonTitleNum ?? 0.0 / 10000
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print(sender.value)
        splitNumberLabel.text = Int(sender.value).description
        let tempNumberOfPeople = splitNumberLabel.text ?? ""
        numberOfPeople = Double(tempNumberOfPeople) ?? 0.0
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
       print("tip \(tip)")
       print("people# \(numberOfPeople)")
       print("billAmount  \(billAmount)")
       let tempTip = billAmount / tip
       finalResult = (billAmount + tempTip) / numberOfPeople
       self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    func goToResults () {
        
    }
   
    @IBAction func billAmountChanged(_ sender: UITextField) {
        let tempBillAmount = sender.text ?? ""
        billAmount = Double(tempBillAmount) ?? 0.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }

}

