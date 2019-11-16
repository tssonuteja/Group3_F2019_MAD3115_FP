//
//  Employee.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import Foundation


let date = Date()
let calendar = Calendar.current
let currentYear = calendar.component(.year, from: date)

class Employee: IPrintable {

 var employeeName: String?
 var type: String?
 var age: Int?
 var vehicle: Vehicle?
 var employeeId: Int?


 
    func calBirthYear() -> Int {
        return currentYear - age!
    }
    
    func printMyData() {
        print("Name of Employee is = \(employeeName!) \nYear of Birth of Employee = \(calBirthYear()) \nEmployee Id is =  \(employeeId!) ")
        
    }
    
    
}
