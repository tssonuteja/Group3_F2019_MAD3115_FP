//
//  DisplayEmployeeViewController.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import UIKit

class DisplayEmployeeViewController: UIViewController {
    
    var internArray: [Intern] = [Intern]()
    var fullTimeArray: [FullTimeEmployee] = [FullTimeEmployee]()
    var cbptArray: [CommisionBasedPartTime] = [CommisionBasedPartTime]()
    var fbptArray: [FixedBasePartTime] = [FixedBasePartTime]()
    
    
    
    @IBOutlet weak var txtEmployeeID: UITextField!
    
    
    
    @IBOutlet weak var lblEmployeeName: UILabel!
    
    
    @IBOutlet weak var lblEmployeeBirthday: UILabel!
    
    
    @IBOutlet weak var lblEmployeeHourlyRate: UILabel!
    
    
    
    @IBOutlet weak var lblEmployeeSalary: UILabel!
    
    
    @IBOutlet weak var lblEmployeeVehicleType: UILabel!
    
    
    @IBOutlet weak var lblEmployeeVehicleMake: UILabel!
    
    
    
    @IBOutlet weak var lblEmployeeVehiclePlate: UILabel!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        print(self.internArray)
        print(self.fullTimeArray)

       
    }
    
    
    
    @IBAction func btnSeeDetails(_ sender: Any) {
    }
    

  

}
