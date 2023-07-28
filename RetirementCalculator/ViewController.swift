//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Hanh Vo on 7/18/23.
//

import UIKit
import AppCenter
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {
    
    @IBOutlet weak var monthlyInvestmentsTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var retirementAgeTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var savingsTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        AppCenter.start(withAppSecret: Constant.appSecret, services:[
          Crashes.self
        ])
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if Crashes.hasCrashedInLastSession {
            let alertController = UIAlertController(title: "Error occurred", message: "An error has occured", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        Analytics.trackEvent("navigated_to_calculator")
    }
    @IBAction func calculateButton_TouchUpInside(_ sender: Any) {
       // MSCrashes.generateTestCrash()
       // Crashes.generateTestCrash()
        
        Analytics.trackEvent("caculate_retirement_amount")
        
    }


}

