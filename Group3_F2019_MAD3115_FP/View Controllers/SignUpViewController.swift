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
    
    if (password != cnfPassword) {
               let myAlert = UIAlertController(title: "Alert", message: "password do not match", preferredStyle: UIAlertControllerStyle.alert)
               let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
               myAlert.addAction(okAction)
               self.present(myAlert,animated: true, completion: nil); return
           }
    
    var stmt: OpaquePointer?
    let insertQuery = "INSERT INTO Signup (name, email, password, cnfpassword) VALUES(?,?,?,?)"
    if sqlite3_prepare(db, insertQuery, -1, &stmt, nil) != SQLITE_OK{
         print("error bindind Query")
         return
         }
    
    if sqlite3_bind_text(stmt, 1, name, -1, nil) != SQLITE_OK {
              print("error bind name")
          return
           }
           
           if sqlite3_bind_text(stmt, 2, email, -1, nil) != SQLITE_OK {
            print("error bind email")
               return
            }

           if sqlite3_bind_text(stmt, 3, password, -1, nil) != SQLITE_OK {
               print("error bind password"); return
            }
       
            if sqlite3_bind_text(stmt, 4, cnfPassword, -1, nil) != SQLITE_OK {
               print("error bind cnfpassword"); return
           }
    
    if sqlite3_step(stmt) == SQLITE_DONE{
               print("data saved")
               let myAlert = UIAlertController(title: "Alert", message: "SignUp Sucessfully!! Move to login Screen", preferredStyle: UIAlertControllerStyle.alert)
                          let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
                          myAlert.addAction(okAction)
               self.present(myAlert,animated: true, completion: nil);
             }
           
           
           nameRegister.text = ""
           emailIdRegister.text = ""
           passwordRegister.text = ""
           cnfPasswordRegister.text = ""
           
           readValues()
           }
    
    
    
    @IBAction func btnGoToLoginScreen(_ sender: Any) {
    }
    
    
    
    
    

   
}
