//
//  SettingsViewController.swift
//  Hu
//
//  Created by Chew Hong Wei Terence on 8/12/19.
//  Copyright © 2019 Chew Hong Wei Terence. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    var fromMainMultiplier = 0.0
    var startingPoints = 0.0
    var multiplier = 1.0
    var maxTai = 0.0
    var isShooterMode = false
    var originalShooterMode = false
    
    var dongPoints = 0.0
    var nanPoints = 0.0
    var xiPoints = 0.0
    var beiPoints = 0.0
    
    @IBOutlet weak var ModeIndicator: UILabel!
    @IBOutlet weak var StartingPointsField: UITextField!
    @IBOutlet weak var MultiplierField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : MainViewController = segue.destination as! MainViewController
        let startingPoints = Double(StartingPointsField.text!)
        let multiplier = Double(MultiplierField.text!)
        if(startingPoints == nil || multiplier == nil) {
            DestViewController.startingPoints = 0.0
            DestViewController.multiplier = fromMainMultiplier
            DestViewController.dongPoints = dongPoints
            DestViewController.nanPoints = nanPoints
            DestViewController.xiPoints = xiPoints
            DestViewController.beiPoints = beiPoints
            DestViewController.isShooterMode = originalShooterMode
        } else {
            DestViewController.startingPoints = startingPoints!
            DestViewController.multiplier = multiplier!
            DestViewController.dongPoints = startingPoints!
            DestViewController.nanPoints = startingPoints!
            DestViewController.xiPoints = startingPoints!
            DestViewController.beiPoints = startingPoints!
            DestViewController.isShooterMode = isShooterMode
        }
        
    }
    

    @IBAction func StartingPointsStepper(_ sender: UIStepper) {
        var number = 0.0
        number = Double(sender.value)
        StartingPointsField.text = String(format: "%.2f", number)
    }
    
    @IBAction func multiplierStepper(_ sender: UIStepper) {
        var number = 0.0
        number = Double(sender.value)
        MultiplierField.text = String(format: "%.2f", number)
    }
    
    
    @IBAction func ConfirmAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DoneSegue", sender: self)
    }
    
    
    @IBAction func doneAction(_ sender: UIButton) {
        StartingPointsField.text = nil
        self.performSegue(withIdentifier: "DoneSegue", sender: self)
    }
    

    @IBAction func switchMode(_ sender: UISwitch) {
    
        if (sender.isOn == true) {
            isShooterMode = true
            ModeIndicator.text = "Shooter mode"
        } else {
            isShooterMode = false
            ModeIndicator.text = "Normal mode"
        }
    
    }
    
    
    
    
}
