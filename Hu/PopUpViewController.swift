//
//  PopUpViewController.swift
//  Hu
//
//  Created by Chew Hong Wei Terence on 9/12/19.
//  Copyright © 2019 Chew Hong Wei Terence. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    var tai = 1
    var multiplier = 0.0
    var isShooterMode = false
    
    
    var winnerEnum = 0
    var dongPoints = 0.0
    var nanPoints = 0.0
    var xiPoints = 0.0
    var beiPoints = 0.0
    
    @IBOutlet weak var TaiLabel: UILabel!

    @IBOutlet weak var dongButton: UIButton!
    @IBOutlet weak var nanButton: UIButton!
    @IBOutlet weak var xiButton: UIButton!
    @IBOutlet weak var beiButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        if (winnerEnum == 1) {
            dongButton.isEnabled = false
            dongButton.setTitle(" ", for: .normal)
        } else if (winnerEnum == 2) {
            nanButton.isEnabled = false
            nanButton.setTitle(" ", for: .normal)
        } else if (winnerEnum == 3) {
            xiButton.isEnabled = false
            xiButton.setTitle(" ", for: .normal)
        } else if (winnerEnum == 4) {
            beiButton.isEnabled = false
            beiButton.setTitle(" ", for: .normal)
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReturnHuSegue" {
            let MainView : MainViewController = segue.destination as! MainViewController
                MainView.multiplier = multiplier
                MainView.dongPoints = dongPoints
                MainView.nanPoints = nanPoints
                MainView.xiPoints = xiPoints
                MainView.beiPoints = beiPoints
                MainView.isShooterMode = isShooterMode
        }
    }
    
    @IBAction func ZiMoHu(_ sender: UIButton) {
        print(isShooterMode)
        let payment = multiplier * pow(2,Double(tai)-1.0)
        switch winnerEnum {
        case 1: //winner is dong
            dongPoints += payment * 6
            nanPoints -= payment * 2
            xiPoints -= payment * 2
            beiPoints -= payment * 2
        case 2: //winner is nan
            dongPoints -= payment * 2
            nanPoints += payment * 6
            xiPoints -= payment * 2
            beiPoints -= payment * 2
        case 3: //winner is xi
            dongPoints -= payment * 2
            nanPoints -= payment * 2
            xiPoints += payment * 6
            beiPoints -= payment * 2
        case 4: //winner is bei
            dongPoints -= payment * 2
            nanPoints -= payment * 2
            xiPoints -= payment * 2
            beiPoints += payment * 6
        default:
            print("Zi mo money error has occured")
        }
        self.performSegue(withIdentifier: "ReturnHuSegue", sender: self)
    }
    
    @IBAction func CancelAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ReturnHuSegue", sender: self)
    }
    
    @IBAction func TaiStepper(_ sender: UIStepper) {
        tai = Int(sender.value)
        TaiLabel.text = String(format: "%d Tai", tai)
    }
    
    
    @IBAction func dongShoot(_ sender: UIButton) {
        if (isShooterMode == true) {
            shooterCalculateMoney()
            shooterShoot(shooter: 1)
        } else {
            calculateMoney()
            shoot(shooter: 1)
        }
        self.performSegue(withIdentifier: "ReturnHuSegue", sender: self)
    }
    @IBAction func nanShoot(_ sender: UIButton) {
        if (isShooterMode == true) {
            shooterCalculateMoney()
            shooterShoot(shooter: 2)
        } else {
            calculateMoney()
            shoot(shooter: 2)
        }
        self.performSegue(withIdentifier: "ReturnHuSegue", sender: self)
    }
    @IBAction func xiShoot(_ sender: UIButton) {
        if (isShooterMode == true) {
            shooterCalculateMoney()
            shooterShoot(shooter: 3)
        } else {
            calculateMoney()
            shoot(shooter: 3)
        }
        self.performSegue(withIdentifier: "ReturnHuSegue", sender: self)
    }
    @IBAction func beiShoot(_ sender: UIButton) {
        if (isShooterMode == true) {
            shooterCalculateMoney()
            shooterShoot(shooter: 4)
        } else {
            calculateMoney()
            shoot(shooter: 4)
        }
        self.performSegue(withIdentifier: "ReturnHuSegue", sender: self)
    }
    
    func calculateMoney() {
        let payment = multiplier * pow(2,Double(tai)-1.0)
        switch winnerEnum {
        case 1: //winner is dong
            dongPoints += payment * 4
            nanPoints -= payment
            xiPoints -= payment
            beiPoints -= payment
        case 2: //winner is nan
            dongPoints -= payment
            nanPoints += payment * 4
            xiPoints -= payment
            beiPoints -= payment
        case 3: //winner is xi
            dongPoints -= payment
            nanPoints -= payment
            xiPoints += payment * 4
            beiPoints -= payment
        case 4: //winner is bei
            dongPoints -= payment
            nanPoints -= payment
            xiPoints -= payment
            beiPoints += payment * 4
        default:
            print("Calculate money error has occured")
        }
    }
    
    func shoot(shooter: Int) {
        let payment = multiplier * pow(2,Double(tai)-1.0)
        switch shooter {
        case 1:
            dongPoints -= payment
        case 2:
            nanPoints -= payment
        case 3:
            xiPoints -= payment
        case 4:
            beiPoints -= payment
        default:
            print("Shooter error has occured")
        }
    }
    
    func shooterCalculateMoney() {
        
        let payment = multiplier * pow(2,Double(tai)-1.0)
        
        switch winnerEnum {
        case 1:
            dongPoints += payment * 4
        case 2:
            nanPoints += payment * 4
        case 3:
            xiPoints += payment * 4
        case 4:
            beiPoints += payment * 4
        default:
            print("Shooter calculate money error has occurred")
        }
    }
    
    func shooterShoot(shooter: Int) {
        let payment = multiplier * pow(2,Double(tai)-1.0)
        switch shooter {
        case 1:
            dongPoints -= payment * 4
        case 2:
            nanPoints -= payment * 4
        case 3:
            xiPoints -= payment * 4
        case 4:
            beiPoints -= payment * 4
        default:
            print("Shooter shoot error has occured")
        }
    }
    
    func test() {
        print(dongPoints)
        print(nanPoints)
        print(xiPoints)
        print(beiPoints)
    }
    
}
