//
//  SetPasscodeViewController.swift
//  PasscodeDemo
//
//  Created by Jay Lin on 2020/7/26.
//  Copyright © 2020 Jay Lin. All rights reserved.
//

import UIKit

class SetPasscodeViewController: UIViewController {

    @IBOutlet weak var setEnterpasscode: UITextField!
    @IBOutlet weak var setConfirmPasscode: UITextField!
    @IBOutlet weak var setSuggestLabel: UILabel!
    
    @IBOutlet weak var passcodeImg: UIImageView!
    @IBOutlet weak var confirmImg: UIImageView!
    
    var setPasscodeArray: [String] = []
    var keyInCount = 0
    var passcode: String = ""
    var confirmPasscode: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberBtn(_ sender: UIButton) {
        
        let passcodeCount = setEnterpasscode.text?.count
        let confirmPasscodeCount = setConfirmPasscode.text?.count
        
        switch keyInCount {
        case 0:
            if setEnterpasscode.text != nil{
                if let passcodeCount = passcodeCount  {
                    if sender.tag != 10 {
                        if passcodeCount < 4 {
                            setEnterpasscode.text = setEnterpasscode.text! + "\(sender.tag)"
                            setSuggestLabel.text = "Enter your passcode below."
                            if passcodeCount == 3 {
                                keyInCount = 1
                                passcodeImg.image = UIImage(named: "勾")
                                passcode = setEnterpasscode.text!
                                setSuggestLabel.text = "Please enter confirm passcode"
                            }
                        }
                    } else if passcodeCount != 0 {
                        setEnterpasscode.text!.removeLast()
                        setSuggestLabel.text = "Enter your passcode below."
                    } else {
                        setSuggestLabel.text = "Setting passcode"
                    }
                }
            }
            
        case 1:
            
            if setConfirmPasscode.text != nil{
                if let confirmPasscodeCount = confirmPasscodeCount  {
                    if sender.tag != 10 {
                        if confirmPasscodeCount < 4 {
                            setConfirmPasscode.text = setConfirmPasscode.text! + "\(sender.tag)"
                            setSuggestLabel.text = "Enter your passcode below."
                            if confirmPasscodeCount == 3 {
                                confirmPasscode = setConfirmPasscode.text!
                                if confirmPasscode == passcode {
                                    confirmImg.image = UIImage(named: "勾")
                                    setPasscodeArray.append(setConfirmPasscode.text!)
                                    setSuggestLabel.text = "Comfirm"
                                    
                                    //alert彈跳視窗
                                    let alertController = UIAlertController(title: "Comfirm", message: "Passcode set up!", preferredStyle: .alert)
                                    /* 建立標題為"Ok"，樣式為.default(預設樣式)的按鈕 */
                                    let ok = UIAlertAction(title: "Ok", style: .default) {
                                        /* alertAction代表被點擊的按鈕 */
                                        (alertAction) in
                                        
                                        //換頁傳值
                                        self.performSegue(withIdentifier: "passcode", sender: alertAction)
                                    }
                                    alertController.addAction(ok)
                                    self.present(alertController, animated: true, completion:nil)

                                } else {
                                    confirmImg.image = UIImage(named: "叉")
                                    setSuggestLabel.text = "Different passcode"
                                }
                            }
                        }
                    } else if confirmPasscodeCount != 0 {
                        setConfirmPasscode.text!.removeLast()
                        setSuggestLabel.text = "Enter your passcode below."
                        confirmImg.image = nil
                    } else {
                        setSuggestLabel.text = "Setting confirm passcode"
                    }
                }
            }
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
           let controller = segue.destination as! EnterPasscodeViewController
           controller.passcodeArray = setPasscodeArray

    }
    
}


