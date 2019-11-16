//
//  Intern.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import Foundation
class Intern: Employee  {
    var internSchoolName: String?
    var stipend: Int?
   
    
    
    
    func calcEarning() -> Int {
        return stipend!
    }
    
    override func  printMyData() {
        super.printMyData()
        print("Employee is Intern Type")
        print("Intern School name is \(internSchoolName!)")
        print("Intern total salary is \(stipend!)")
        
        
    }
    
    
}
