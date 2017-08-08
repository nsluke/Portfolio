//
//  AuthenticationViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 8/8/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit
import LocalAuthentication

class AuthenticationViewController: UIViewController, UIAlertViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticateUser()
    }
    
    
    func authenticateUser() {
        let authContext : LAContext = LAContext()
        var error: NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Biometric Check for application", reply: {successful, error -> Void in
                if successful{
                    print("TouchID Yes")
                }
                else{
                    print("TouchID No")
                }
            }
            )
        } else {
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthentication, localizedReason: "Enter your Passcode", reply: {
                successful,error in
                if successful{
                    print("PassCode Yes")
                }
                else{
                    print("PassCode No")
                }
            }
            )
        }
    }
    func showPasswordAlert() {
        let passwordAlert : UIAlertView = UIAlertView(title: "TouchIDDemo", message: "Please type your password", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Okay")
        passwordAlert.alertViewStyle = UIAlertViewStyle.secureTextInput
        passwordAlert.show()
    }
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if buttonIndex == 1 {
            if !(alertView.textField(at:0)!.text?.isEmpty)! {
                if alertView.textField(at: 0)!.text == "appcoda" {
                    
                }
                else{
                    showPasswordAlert()
                }
            }
            else{
                showPasswordAlert()
            }
        }
    }
}
