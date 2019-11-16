//
//  FullTime.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import Foundation
class FullTimeEmployee: Employee {
    var salary: Double?
    var bonus: Double?
    
    
    func calcEarning() -> Double {
        return salary!*((100+bonus!)/100)
    }
    
    
    
    
    
    override func printMyData() {
        super.printMyData()
        print("Employee Type is Full Time")
        print("Employee total Salary is =  \(calcEarning())")
        
    }
    
    
}
