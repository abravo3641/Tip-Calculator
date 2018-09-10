//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Anthony Bravo on 9/9/18.
//  Copyright © 2018 Anthony Bravo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var manual: UISwitch!
    @IBOutlet weak var tipField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ontap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        if(!manual.isOn) {
            let bill = Double(billField.text!) ?? 0
            let tipValues = [0.1, 0.15, 0.2]
            let tip = bill * tipValues[tipControl.selectedSegmentIndex]
            let total = bill + tip
            tipLabel.text = "$" + String(format: "%.2f",tip)
            totalLabel.text = "$" + String(format: "%.2f",total)
        }
        else if(billField.text != "") {
            let bill = Double(billField.text!) ?? 0
            var tip_value = Double(tipField.text!) ?? 0
            if(tip_value < 0) { tip_value = 0  }
            let tip = bill * (tip_value/100)
            let total = bill + tip_value
            tipLabel.text = "$" + String(format: "%.2f",tip)
            totalLabel.text = "$" + String(format: "%.2f",total)
            
        }
        else {
            totalLabel.text = "$" + String(format: "%.2f",0)
        }
    }
    

    
}

