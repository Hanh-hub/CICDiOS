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
        print("how are you")
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
        
        
        // Guard against optional or invalid inputs
        guard let monthlyInvestments = Double(monthlyInvestmentsTextField.text ?? ""),
              let currentAge = Double(ageTextField.text ?? ""),
              let retirementAge = Double(retirementAgeTextField.text ?? ""),
              let interestRate = Double(interestRateTextField.text ?? ""),
              let currentSavings = Double(savingsTextField.text ?? "") else {
            resultLabel.text = "Invalid input. Please enter all values correctly."
            return
        }

        let monthsLeft = (retirementAge - currentAge) * 12
        var totalSavings = currentSavings
        let monthlyRate = interestRate / (100 * 12)

        // Use compound interest formula: A = P * (1 + r/n)^(nt)
        for _ in 1...Int(monthsLeft) {
            totalSavings *= 1 + monthlyRate
            totalSavings += monthlyInvestments
        }

        // Display result
        let formattedSavings = String(format: "%.2f", totalSavings)
        resultLabel.text = "You'll have $\(formattedSavings) at retirement."
        
    }
}

