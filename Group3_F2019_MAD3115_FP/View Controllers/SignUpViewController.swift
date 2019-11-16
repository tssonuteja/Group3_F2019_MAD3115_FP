//
//  SignUpViewController.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var db: OpaquePointer?
    var SignUpArray: [SignUp] = [SignUp]()
    
    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var regEmailID: UITextField!
    
    
    @IBOutlet weak var txtSuPassword: UITextField!
    
    @IBOutlet weak var txtSuCPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readValues()
               let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("SignUpDatabase.sqlite")
               
               if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
                   self.title = "hello mohit"
                   print("error opening meassage")
                   return
               }
        
        
        
              if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Signup (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, email TEXT, password TEXT, cnfpassword TEXT )", nil,nil,nil) != SQLITE_OK{
                  print("error createing table ")
                  return
              }
        //test

        print("good")
               readValues()
           }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
        }
       
    
    
    
    @IBAction func btnSignUp(_ sender: Any) {
        let name = txtName.text
        let email = regEmailID.text
         let password = txtSuPassword.text
         let cnfPassword = txtSuCPassword.text
        if (name?.isEmpty)! || (email?.isEmpty)! || (password?.isEmpty)!  || (cnfPassword?.isEmpty)! {
            let myAlert = UIAlertController(title: "Alert", message: "all fields are required", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                   myAlert.addAction(okAction)
             self.present(myAlert,animated: true, completion: nil); return
        }
        
    }
    
    
    
    @IBAction func btnGoToLoginScreen(_ sender: Any) {
    }
    
    
    
    
    

   
}
