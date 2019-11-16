//
//  Vehicle.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import Foundation
class Vehicle: IPrintable
{
    var make: String?
    var plate: String?
    
    
    func printMyData() {
        print("Make Of car is = \(make!) \nPlate of car is = \(plate!)")
    }
}
