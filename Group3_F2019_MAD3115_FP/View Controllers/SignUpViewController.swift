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
        //test

        
    }
    
    
    @IBAction func btnSignUp(_ sender: Any) {
    }
    
    
    
    @IBAction func btnGoToLoginScreen(_ sender: Any) {
    }
    
    
    
    
    

   
}
