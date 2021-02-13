//
//  ViewController.swift
//  Hu
//
//  Created by Chew Hong Wei Terence on 8/12/19.
//  Copyright © 2019 Chew Hong Wei Terence. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var multiplier = 0.1
    var startingPoints = 0.0
    var maxTai = 0.0
    
    var winnerEnum = 0
    var isShooterMode = false
    
    var dongPoints = 0.0
    var nanPoints = 0.0
    var xiPoints = 0.0
    var beiPoints = 0.0
    
    @IBOutlet weak var dongLabel: UILabel!
    @IBOutlet weak var nanLabel: UILabel!
    @IBOutlet weak var xiLabel: UILabel!
    @IBOutlet weak var beiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        dongPoints = startingPoints
//        nanPoints = startingPoints
//        xiPoints = startingPoints
//        beiPoints = startingPoints
        updateAll()
    }

    func updateDong() {
        dongLabel.text = String(format: "%.2f", dongPoints)
    }
    func updateNan() {
        nanLabel.text = String(format: "%.2f", nanPoints)
    }
    func updateXi() {
        xiLabel.text = String(format: "%.2f", xiPoints)
    }
    func updateBei() {
        beiLabel.text = String(format: "%.2f", beiPoints)
    }
    func updateAll() {
        updateDong()
        updateNan()
        updateXi()
        updateBei()
    }

    @IBAction func settings(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SettingsSegue", sender: self)
    }
    
    // ALL THE PLUS AND MINUS
    
    @IBAction func DongPlus(_ sender: UIButton) {
        dongPoints += 0.1
        updateDong()
    }
    
    @IBAction func DongMinus(_ sender: UIButton) {
        dongPoints -= 0.1
        updateDong()
    }
    
    @IBAction func NanPlus(_ sender: UIButton) {
        nanPoints += 0.1
        updateNan()
    }
    
    @IBAction func NanMinus(_ sender: UIButton) {
        nanPoints -= 0.1
        updateNan()
    }
    
    @IBAction func XiPlus(_ sender: UIButton) {
        xiPoints += 0.1
        updateXi()
    }
    
    @IBAction func XiMinus(_ sender: UIButton) {
        xiPoints -= 0.1
        updateXi()
    }
    
    
    @IBAction func BeiPlus(_ sender: UIButton) {
        beiPoints += 0.1
        updateBei()
    }
    
    @IBAction func BeiMinus(_ sender: UIButton) {
        beiPoints -= 0.1
        updateBei()
    }
    
    
    // THE GANG ALL GOES HERE
    @IBAction func DongKong(_ sender: UIButton) {
        dongPoints += multiplier*3
        nanPoints -= multiplier
        xiPoints -= multiplier
        beiPoints -= multiplier
        updateAll()
    }
    
    @IBAction func NanKong(_ sender: UIButton) {
        dongPoints -= multiplier
        nanPoints += multiplier*3
        xiPoints -= multiplier
        beiPoints -= multiplier
        updateAll()
    }
    
    @IBAction func XiKong(_ sender: UIButton) {
        dongPoints -= multiplier
        nanPoints -= multiplier
        xiPoints += multiplier*3
        beiPoints -= multiplier
        updateAll()
    }
    
    @IBAction func BeiKong(_ sender: UIButton) {
        dongPoints -= multiplier
        nanPoints -= multiplier
        xiPoints -= multiplier
        beiPoints += multiplier*3
        updateAll()
    }
    

    
    // Hu buttons
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RequestHuSegue" {
            let PopUp : PopUpViewController = segue.destination as! PopUpViewController
            PopUp.multiplier = multiplier
            PopUp.dongPoints = dongPoints
            PopUp.nanPoints = nanPoints
            PopUp.xiPoints = xiPoints
            PopUp.beiPoints = beiPoints
            PopUp.winnerEnum = winnerEnum
            PopUp.isShooterMode = isShooterMode
        } else if segue.identifier == "SettingsSegue" {
            let SettingsView : SettingsViewController = segue.destination as! SettingsViewController
            SettingsView.fromMainMultiplier = multiplier
            SettingsView.dongPoints = dongPoints
            SettingsView.nanPoints = nanPoints
            SettingsView.xiPoints = xiPoints
            SettingsView.beiPoints = beiPoints
            SettingsView.originalShooterMode = isShooterMode
        }
    }
    
    @IBAction func dongHu(_ sender: UIButton) {
        winnerEnum = 1
        self.performSegue(withIdentifier: "RequestHuSegue", sender: self)
    }
    @IBAction func nanHu(_ sender: UIButton) {
        winnerEnum = 2
        self.performSegue(withIdentifier: "RequestHuSegue", sender: self)
    }
    @IBAction func xiHu(_ sender: UIButton) {
        winnerEnum = 3
        self.performSegue(withIdentifier: "RequestHuSegue", sender: self)
    }
    @IBAction func beiHu(_ sender: UIButton) {
        winnerEnum = 4
        self.performSegue(withIdentifier: "RequestHuSegue", sender: self)
    }
    
    
    
    
    
}

