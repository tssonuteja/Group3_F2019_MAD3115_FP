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
    
    
    @IBOutlet weak var lblEmployeeRate: UILabel!
    
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        print(self.internArray)
        print(self.fullTimeArray)
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func btnSeeDetails(_ sender: Any) {
        for j in 0...internArray.count-1{
                   if (internArray[j].employeeId == Int(txtEmployeeID.text!)){
                       lblEmployeeName.text = internArray[j].employeeName
                       lblEmployeeBirthday.text = String(internArray[j].calBirthYear())
                       lblEmployeeRate.text = String(internArray[j].stipend!)
                       lblEmployeeHourlyRate.text = String(internArray[j].internSchoolName!)
                       lblEmployeeSalary.isHidden = true
                    
                    
                    if internArray[j].vehicle == nil
                    {
                        
                        lblEmployeeVehicleMake.text = "employee has no vehicle"
                                   }
                    else{
                lblEmployeeVehicleMake.text = "make is \(internArray[j].vehicle?.make! ?? "AUDI")"
                lblEmployeeVehiclePlate.text = "plate is \(internArray[j].vehicle?.plate! ?? "C76ON1")"
                                   }
                    
                   }
                               else{
                                   print("not found") }
            
            
            for j in 0...fullTimeArray.count-1{
            if (fullTimeArray[j].employeeId == Int(txtEmployeeID.text!)){
                lblEmployeeName.text = fullTimeArray[j].employeeName
                lblEmployeeBirthday.text = String(fullTimeArray[j].calBirthYear())
                lblEmployeeRate.text = String(fullTimeArray[j].bonus!)
                lblEmployeeHourlyRate.text = String(fullTimeArray[j].calcEarning())
                lblEmployeeSalary.isHidden = true
                
                if fullTimeArray[j].vehicle == nil{
                                lblEmployeeVehicleMake.text = "employee has no vehicle"
                            }
                else
                {
            lblEmployeeVehicleMake.text = "make is \(fullTimeArray[j].vehicle?.make! ?? "BMW")"
             lblEmployeeVehiclePlate.text = "plate is \(fullTimeArray[j].vehicle?.plate! ?? "C74ON12")"
                            }
                        }else{
                            print("not found") }
                        
                    }
                }
                
                
        
    }
    

  

}
