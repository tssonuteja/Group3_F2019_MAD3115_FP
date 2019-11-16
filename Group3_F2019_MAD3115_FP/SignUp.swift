//
//  SignUp.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import Foundation
class SignUp {
      var id: Int = 0
      var empName: String = ""
      var empEmailId: String = ""
      var empPassword: String = ""
      var cnfPassword: String = ""
    
init(id: Int, empName: String, empEmailId: String, empPassword: String, cnfPassword: String){
        self.id = id
        self.empName = empName
        self.empEmailId = empEmailId
        self.empPassword = empPassword
        self.cnfPassword = cnfPassword
    }
    
}
