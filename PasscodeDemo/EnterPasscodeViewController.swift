//
//  ViewController.swift
//  PasscodeDemo
//
//  Created by Jay Lin on 2020/7/25.
//  Copyright © 2020 Jay Lin. All rights reserved.
//

import UIKit

class EnterPasscodeViewController: UIViewController{
    
    @IBOutlet weak var enterPasscode: UITextField!
    @IBOutlet weak var suggestLabel: UILabel!
    
    @IBOutlet weak var passcodeImg: UIImageView!
    
    var passcodeArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberBtn(_ sender: UIButton) {
        
        let passcodeCount = enterPasscode.text?.count
        
        if enterPasscode.text != nil{
            if let passcodeCount = passcodeCount  {
                if sender.tag != 10 {
                    if passcodeCount < 4 {
                        enterPasscode.text = enterPasscode.text! + "\(sender.tag)"
                        suggestLabel.text = "Enter your passcode below."
                        if passcodeCount == 3 {
                            if enterPasscode.text == passcodeArray[0] {
                                suggestLabel.text = "Passcode is correct"
                                passcodeImg.image = UIImage(named: "勾")
                                //換頁傳值
                                self.performSegue(withIdentifier: "unlock", sender: self)
                            } else {
                                suggestLabel.text = "Passcode is wrong"
                                passcodeImg.image = UIImage(named: "叉")
                            }
                        }
                    }
                } else if passcodeCount != 0 {
                    enterPasscode.text!.removeLast()
                    suggestLabel.text = "Enter your passcode below."
                    passcodeImg.image = nil
                } else {
                    suggestLabel.text = "Have you forgotten your passcode?"
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
           let controller = segue.destination as! UnlockPageViewController
           controller.passcode = passcodeArray
    }
}

