//
//  LoginViewController.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    var SignUpArray: [SignUp] = [SignUp]()
    
    
    @IBOutlet weak var txtEmailID: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("what's in the array?")
               print(self.SignUpArray)
               print("------")
// test
       
    }
    
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           }
    
    
    
    @IBAction func btnLogin(_ sender: Any) {
        for j in 0...SignUpArray.count - 1 {
        if (txtPassword.text! == SignUpArray[j].empPassword )
         {
             print("array works")
             print("\(SignUpArray[j].id)")
             print("\(SignUpArray.count)")
             print("\(txtEmail.text!)")
             print("\(txtPassword.text!)")
             print("\(SignUpArray[j].empPassword)")
             print("\(SignUpArray[j].empEmailId)")
             performSegue(withIdentifier: "HomeVC", sender: self)
             return

             }
            
        }
        
        if (txtPassword.text! != SignUpArray[SignUpArray.count-1].empPassword ){
                    print("User Email/Password incorrect")
            let myAlert = UIAlertController(title: "Alert", message: "Invalid Email/ Password !!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                    myAlert.addAction(okAction)
                    self.present(myAlert,animated: true, completion: nil)
                    }
                
            }
        
        
    }
    
    
    @IBAction func btnSignUp(_ sender: Any) {
    }
    

}
