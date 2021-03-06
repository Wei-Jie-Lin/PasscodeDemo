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
    
    var passcodeArray: [String] = ["0000"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func numberBtn(_ sender: UIButton) {
        
        let passcodeCount = enterPasscode.text?.count
        
        
        if enterPasscode.text != nil{
            if let passcodeCount = passcodeCount  {
                if sender.tag != 10 {
                    if passcodeCount < 4 {
                        enterPasscode.text = enterPasscode.text! + "\(sender.tag)"
                        suggestLabel.text = "Enter your passcode below."
                        print("還可繼續輸入")
                        if passcodeCount == 3 {
                            if enterPasscode.text == passcodeArray[0] {
                                suggestLabel.text = "Password is correct"
                                print("密碼正確")
                            } else {
                                suggestLabel.text = "wrong password"
                                print("密碼錯誤")
                            }
                        }
                    }
                } else if passcodeCount != 0 {
                    enterPasscode.text!.removeLast()
                    suggestLabel.text = "Enter your passcode below."
                    print("刪除一位數")
                    print(passcodeCount)

                } else {
                    print(passcodeCount)
                    suggestLabel.text = "Default password is 『0000』"
                    print("沒有數字")
                    
                }
            }
        }
    }
}

