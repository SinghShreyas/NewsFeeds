//
//  ViewController.swift
//  NewsFeeds
//
//  Created by shreyas on 12/3/17.
//  Copyright © 2017 shreyas. All rights reserved.
//

import UIKit


class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var signInEmailField: UITextField!
    @IBOutlet weak var signInPasswordField: UITextField!

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var passwordHideIcon: UIImageView!
    
    var iconClicked: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconClicked = true
        sideMenus()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignInViewController.tappedImage))
        passwordHideIcon.addGestureRecognizer(tap)
        passwordHideIcon.isUserInteractionEnabled = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Validate Email ID
    func isValidEmail(emailId: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailId)
    }
    
    //Validate Password
    func isValidPassword(password: String) -> Bool {
        if password.count > 6 {
            return true;
        } else{
            return false;
        }
    }
    
    func updateUI() {
        
        let validEmail = self.isValidEmail(emailId: self.signInEmailField.text!)
        let validPassword = self.isValidPassword(password: self.signInPasswordField.text!)
        
        if !validEmail {
            ProgressHUD.showError("Invalid Email!")
        }
        
        if !validPassword {
            ProgressHUD.showError("Invalid Password!")
        }
        if !validEmail && !validPassword {
            ProgressHUD.showError("Invalid Email and Password!")
        }
        
        if validEmail && validPassword {
            ProgressHUD.show("Loging In!")
           
        }
    }
    // Login Button Action
    @IBAction func signInButtonAction(_ sender: UIButton) {
    
    let validEmail: Bool = self.isValidEmail(emailId: self.signInEmailField.text!)
    let validPassword: Bool = self.isValidPassword(password: self.signInPasswordField.text!)
    
    updateUI()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            // Put your code which should be executed with a delay here
            ProgressHUD.dismiss()
            if validEmail && validPassword {
            let images = self.storyboard?.instantiateViewController(withIdentifier:"NewsViewController") as! NewsViewController
            self.present(images, animated: true, completion: nil)
        }
        
        })
       
    print(validEmail)
    print(validPassword)
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
    
    func tappedImage()
    {
        print("Tapped on Image")

        if(iconClicked == true) {
            signInPasswordField.isSecureTextEntry = false
            iconClicked = false
            passwordHideIcon.image = UIImage(named: "pass_unlocked")
        } else {
            signInPasswordField.isSecureTextEntry = true
            iconClicked = true
            passwordHideIcon.image = UIImage(named: "pass_locked")
        }
    }
}


