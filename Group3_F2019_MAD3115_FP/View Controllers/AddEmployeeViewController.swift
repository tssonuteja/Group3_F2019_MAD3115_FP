//
//  AddEmployeeViewController.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-15.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import UIKit
import SQLite3

class AddEmployeeViewController: UIViewController {
    
    var db : OpaquePointer?
    
    var internArray: [Intern] = [Intern]()
    var fullTimeArray: [FullTimeEmployee] = [FullTimeEmployee]()
    var cbptArray: [CommisionBasedPartTime] = [CommisionBasedPartTime]()
    var fbptArray: [FixedBasePartTime] = [FixedBasePartTime]()
    
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmpID: UITextField!
    @IBOutlet weak var txtVehicleMake: UITextField!
    @IBOutlet weak var txtVehiclePlate: UITextField!
    @IBOutlet weak var txtVehicleColour: UITextField!
    
    
    
    @IBOutlet weak var txtStipend: UITextField!
    @IBOutlet weak var txtSchoolName: UITextField!
    @IBOutlet weak var txtFullTimeCommissionPercentage: UITextField!
    @IBOutlet weak var txtFullTimeSalary: UITextField!
    @IBOutlet weak var txtFixedBasedSalary: UITextField!
    @IBOutlet weak var txtFixedBasedHourlyRate: UITextField!
    @IBOutlet weak var txtFixedBasedHoursWorked: UITextField!
    
    @IBOutlet weak var txtCommissionBasedSalary: UITextField!

    @IBOutlet weak var txtCommissionBasedHourlyRate: UITextField!
    
    @IBOutlet weak var txtCommissionBasedHourlyWork: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("AddEmployee.sqlite")
           if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
               self.title = "hello Jeena"
               print("error opening meassage")
               return
           }
           if sqlite3_exec(db, "DROP TABLE IF EXISTS AddEmployee", nil, nil, nil) != SQLITE_OK{
               print("deletrd")
           }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS AddEmployee (id INTEGER PRIMARY KEY AUTOINCREMENT, employeeid INTEGER, name TEXT, age INTEGER, make TEXT, plate TEXT, attribute TEXT, stipend INTEGER, schoolname TEXT, salary INTEGER, commissionpercentage FLOAT, hoursworked INTEGER, fixedsalary FLOAT, rate INTEGER )", nil,nil,nil) != SQLITE_OK{
                   print("error createing table ")
                   return
               }
               
               print("good")
               txtVehicleMake.isEnabled = false
               txtVehiclePlate.isEnabled = false
               internView.isHidden = false
              fullTimeView.isHidden = true
              fbptView.isHidden = true
               readValues()
               }

           override func didReceiveMemoryWarning() {
               super.didReceiveMemoryWarning()
               
           }
        
        
    
    
    @IBOutlet weak var vehicleOption: UISegmentedControl!
    
    @IBAction func vehicleAttribute(_ sender: Any) {
        
        switch vehicleOption.selectedSegmentIndex {
        case 0:
          txtVehicleMake.isEnabled = false
            txtVehiclePlate.isEnabled = false
            case 1:
            txtVehiclePlate.isEnabled = true
            txtVehicleMake.isEnabled = true
            
        default:
            break
        }
        }
    }
    
    
    
    
    

}
