//
//  SignUpViewController.swift
//  NewsFeeds
//
//  Created by shreyas on 12/6/17.
//  Copyright © 2017 shreyas. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenus()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Validate First name and Last name
    func validateName(firstName: String, lastName: String) -> Bool {
        
        let RegEx = "^[a-z\\sA-Z]+$"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        let resultFirstName: Bool = Test.evaluate(with: firstName.trimmingCharacters(in: .whitespaces))
        let resultLastName: Bool = Test.evaluate(with: lastName.trimmingCharacters(in: .whitespaces))
        
        if resultFirstName && resultLastName {
            return true
        } else {
            return false
        }
        
    }
    
    // Validate email ID
    func validateEmail(emailId: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailId)
    }
    
    // Validate Password
    func validatePassword(password: String) -> Bool {
        // TODO: write Logic
        if password.count > 6 {
            return true;
        } else {
            return false;
        }
    }
    
    // Match Password
    func matchBothPassword(password1: String, password2: String) -> Bool {
        // TODO: Write logic
        if password1 == password2 {
            return true
        } else {
            return false
        }
    }
    
    // Combined form Validation
    func validateEntireForm(firstName: String, lastName: String, email: String, password1: String, password2: String) -> Bool {
        //TODO: Write Logics
    
        let validName = self.validateEmail(emailId: email)
        
        let validEmail = self.validateName(firstName: firstName, lastName: lastName)
        
        let validPassword = self.validatePassword(password: password1)
        
        let validConfirmPassword = self.matchBothPassword(password1: password1, password2: password2)
        
        if validName && validEmail && validPassword && validConfirmPassword {
            return true;
        } else {
            return false
            
        }
    }
    
    
    @IBAction func registerButtonAction(_ sender: Any) {
        
        ProgressHUD.showError("Database Configuration in progress!")
        if self.validateEntireForm(firstName: self.firstName.text!, lastName: self.lastName.text!, email: self.emailId.text!, password1: self.password.text!, password2: self.confirmPassword.text!) {
            //TODO: Registration Logic Here
            print("DONE VALIDATION")
        } else {
            print("VALIDATION ERROR")
        }
    }
    
    func sideMenus() {
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }

}
