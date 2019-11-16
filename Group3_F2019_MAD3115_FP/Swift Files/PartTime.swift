//
//  PartTime.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import Foundation
class PartTime: Employee {
    var numberOfHoursWorked: Int?
    var rate: Int?
    
    
    
    
    func printMydata()  {
        super.printMyData()
        print("Number of Hours Worked By Employee =  \(numberOfHoursWorked!) \nWage Rate Of Employee = \(rate!) ")
    }
    
    
}
