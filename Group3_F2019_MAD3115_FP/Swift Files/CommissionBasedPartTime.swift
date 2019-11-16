//
//  CommissionBasedPartTime.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import Foundation
class CommisionBasedPartTime: PartTime {
    var commisionPercentage: Double?
  
    
    
    func calcEarnings() -> Double {
        return (Double)(numberOfHoursWorked!*rate!) + ((Double(numberOfHoursWorked!*rate!))*(commisionPercentage!/100))
    }
    
    
    
    
    override func printMyData() {
        super.printMydata()
        print("Employee is Commision Based Part Time")
        print("Total Earning is \(calcEarnings())")
        
        
    }
    
    
    
    
}
