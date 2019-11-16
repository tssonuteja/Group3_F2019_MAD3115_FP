//
//  FixedBasedPartTime.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import Foundation
class FixedBasePartTime: PartTime {
    var fixedAmount: Int?
    
    override init() {
        
    }
    
    
    func calcEarning() -> Int {
        
        return (rate!*numberOfHoursWorked!) + (fixedAmount!)
    }
    
    override func printMyData() {
        
        super.printMydata()
        print("Employee is PartTime / Fixed Amt")
        print("Total Earning is \(calcEarning())")
        
        
    }
    
}
