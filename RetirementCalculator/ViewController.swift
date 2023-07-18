//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Hanh Vo on 7/18/23.
//

import UIKit
import AppCenter
import AppCenterCrashes

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AppCenter.start(withAppSecret: Constant.appSecret, services:[
          Crashes.self
        ])
        // Do any additional setup after loading the view.
    }


}

