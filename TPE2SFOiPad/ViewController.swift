//
//  ViewController.swift
//  TPE2SFOiPad
//
//  Created by zip520123 on 2017/7/29.
//  Copyright © 2017年 zip520123. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var ledOn = false
    @IBAction func ledTest(_ sender: Any) {
        ledOn = !ledOn
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        let urlString = "http://mylinkit.local:8090/\(ledOn)"
        print("ledOn\(ledOn)")
        Alamofire.request(urlString).response { (_) in
            hud.hide(animated: true)
        }
    }
    @IBAction func unwindToindex(segue: UIStoryboardSegue){
        
    }

}

