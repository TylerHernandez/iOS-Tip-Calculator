//
//  ViewController.swift
//  iOS Tip Calculator
//
//  Created by Tyler Hernandez on 2/3/21.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var roundedTipLabel: UILabel!
    @IBOutlet weak var roundedTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.0, 0.15, 0.18, 0.2]
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Calculate rounded total amount
        let roundedTotal = round(total)
        let roundedTip = roundedTotal - bill
        
        
        // Control background color based on tip % choice
        if tipControl.selectedSegmentIndex == 0 {
            self.view.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        }
        else if tipControl.selectedSegmentIndex == 1 {
            self.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        else if tipControl.selectedSegmentIndex == 2 {
            self.view.backgroundColor = #colorLiteral(red: 0.6397068776, green: 0.6924797629, blue: 0, alpha: 1)
        }
        else {
            self.view.backgroundColor = #colorLiteral(red: 0.0606436178, green: 1, blue: 0, alpha: 1)
        }
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        // Update Rounded tip label
        roundedTipLabel.text = String(format: "$%.2f", roundedTip)
        // Update Rounded total label
        roundedTotalLabel.text = String(format: "$%.2f", roundedTotal)
       
    }

}

