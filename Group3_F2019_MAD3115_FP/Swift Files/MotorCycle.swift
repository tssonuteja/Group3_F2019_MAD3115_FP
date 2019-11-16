//
//  MotorCycle.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import Foundation
class Motorcycle: Vehicle
{
    var getKerbWeight: Int?
    
    
    
    override func printMyData()
    {
        print("Employee Has a Motorcycle")
        super.printMyData()
        print("Weight of MotorCycle is = \(getKerbWeight!)")
    }
}
