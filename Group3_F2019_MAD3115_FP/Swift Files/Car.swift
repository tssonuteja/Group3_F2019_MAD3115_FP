//
//  Car.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import Foundation
class Car: Vehicle
{
    var numberOfSeats: Int?
    
    
    
    override func printMyData() {
        print("Employee Has a CAR")
        super.printMyData()
        print("car is = \(numberOfSeats!)\t Seater")
    }
}
