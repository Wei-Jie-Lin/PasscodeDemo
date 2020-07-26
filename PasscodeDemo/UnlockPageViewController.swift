//
//  UnlockPageViewController.swift
//  PasscodeDemo
//
//  Created by Jay Lin on 2020/7/26.
//  Copyright © 2020 Jay Lin. All rights reserved.
//

import UIKit

class UnlockPageViewController: UIViewController {

    @IBOutlet weak var smileImg: UIImageView!
    
    var passcode: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //alert彈跳視窗
        let alertController = UIAlertController(title: "Congratulations", message: "Passcode is \(String(passcode[0]))", preferredStyle: .alert)
        /* 建立標題為"Ok"，樣式為.default(預設樣式)的按鈕 */
        let ok = UIAlertAction(title: "Ok", style: .default) {
            /* alertAction代表被點擊的按鈕 */
            (alertAction) in
            self.smileImg.image = UIImage(named: "笑臉")
        }
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion:nil)
    }

}
