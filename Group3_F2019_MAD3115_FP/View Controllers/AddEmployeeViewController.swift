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
    
    
    @IBOutlet weak var txtDate: UITextField!
    var pickerView = UIPickerView()
    var datePicker = UIDatePicker()
    let toolBar = UIToolbar()
    
    
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
        
        setupToolBar()
        setupPicker()
        setupTextFields()
        
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
              FixedBasedPartTimeView.isHidden = true
               readValues()
               }

           override func didReceiveMemoryWarning() {
               super.didReceiveMemoryWarning()
               
           }
    
    
    func setupPicker(){
        pickerView.delegate = self as? UIPickerViewDelegate
    txtDate.inputView = pickerView
    txtDate.inputAccessoryView = toolBar

    }
    func setupToolBar(){
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBtnAction))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton =   UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelBtnAction))
        toolBar.setItems([cancelButton, space,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
    }
    @objc func datePickerValueChanged(_ date:UIDatePicker){
        txtDate.text = datePicker.date.dateformatter()
    }
    
    func setupTextFields(){
        txtDate.inputAccessoryView = toolBar
        txtDate.inputView = datePicker
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
               let date = txtDate.text ?? ""
              
               
               }
               
            
           @objc func doneBtnAction(){
               view.endEditing(true)
           }
           
           
           @objc func cancelBtnAction(){
               view.endEditing(true)
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
    
    
    @IBOutlet weak var vehicleSeg: UISegmentedControl!
    
    
    @IBAction func vehicleType(_ sender: Any) {
        
        switch vehicleSeg.selectedSegmentIndex {
        case 0:
            txtVehicleColour.placeholder = "enter car colour"
            
        case 1:
           txtVehicleColour.placeholder = "enter bike weight"
           
        default:
            break;
        }
        }
    
    
    @IBOutlet weak var internView: UIView!
    
    
    @IBOutlet weak var fullTimeView: UIView!
    
    
    @IBOutlet weak var FixedBasedPartTimeView: UIView!
    
    
    
    @IBOutlet weak var employeementType: UISegmentedControl!
    
    
    @IBAction func employeementTypeSegment(_ sender: Any) {
        switch employeementType.selectedSegmentIndex {
            case 0:
             internView.isHidden = false
             fullTimeView.isHidden = true
             FixedBasedPartTimeView.isHidden = true
                break
            case 1:
                fullTimeView.isHidden = false
                internView.isHidden = true
                FixedBasedPartTimeView.isHidden = true
                break
            case 2:
                FixedBasedPartTimeView.isHidden = false
                internView.isHidden = true
                fullTimeView.isHidden = true
                txtFixedBasedSalary.placeholder = " Enter Fixed Salary"
                
                break
            case 3:
                internView.isHidden = true
                FixedBasedPartTimeView.isHidden = false
                fullTimeView.isHidden = true
                txtFixedBasedSalary.placeholder = "Enter Commision %"
                break
            
            default:
                break
            }
            }
    
    
    @IBAction func btnsaveData(_ sender: Any) {
        
        let name = txtFullName.text
          let employeeid = txtEmpID.text
         // let age = employeeAge.text
          let make = txtVehicleMake.text
          let  plate = txtVehiclePlate.text
          let attribute = txtVehicleColour.text
          let stipend = txtStipend.text!
          let schoolname = txtSchoolName.text
          let salary = txtFullTimeSalary.text
          let commissionpercentage = txtFullTimeCommissionPercentage.text!
          let fixedsalary = txtFullTimeSalary.text!
          let hoursworked = txtFixedBasedHoursWorked.text!
          let rate = txtFixedBasedHourlyRate.text!
        
        
        
        var stmt: OpaquePointer?
        
        
        let queryString = "INSERT INTO AddEmployee ( employeeid, name ,age ,make ,plate ,attribute ,stipend ,schoolname ,salary , commissionpercentage , hoursworked , fixedsalary , rate ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)"
       
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            print("error bindind Query"); return;
            
        }
        
        if sqlite3_bind_int(stmt, 1, (employeeid! as NSString).intValue) != SQLITE_OK {
            print("error bind email")
            return;
        }
        
        
        if sqlite3_bind_text(stmt, 2, name, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
      
        if sqlite3_bind_text(stmt, 4, make, -1, nil) != SQLITE_OK {
            print("error bind email")
            return
        }
        
        if sqlite3_bind_text(stmt, 5, plate, -1, nil) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_text(stmt, 6, attribute, -1, nil) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_int(stmt, 7, (stipend as NSString).intValue) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_text(stmt, 8, schoolname, -1, nil) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_text(stmt, 9, salary, -1, nil) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_int(stmt, 10,(commissionpercentage as NSString).intValue) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_int(stmt, 11, (fixedsalary as NSString).intValue)  != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_int(stmt, 12, (hoursworked as NSString).intValue)   != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_int(stmt, 13, (rate as NSString).intValue) != SQLITE_OK {
            print("error bind email")
            return
        }
        
         if sqlite3_step(stmt) == SQLITE_DONE{
                    print("data saved")
            let myAlert = UIAlertController(title: "Alert", message: "Data saved", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                    myAlert.addAction(okAction)
                    self.present(myAlert,animated: true, completion: nil);
                }
                readValues()
                
                }
           
            func readValues(){
        
                let queryString = "SELECT * FROM AddEmployee "
        
                var stmt:OpaquePointer?
                if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("error preparing insert: \(errmsg)")
                    return
                }
                
                
                while(sqlite3_step(stmt) == SQLITE_ROW){
                          let id = sqlite3_column_int(stmt, 0)
                          let name = String(cString: sqlite3_column_text(stmt, 2))
                          let employeeid =  sqlite3_column_int(stmt, 1)
                          let age = sqlite3_column_int(stmt, 3)
                          let make = String(cString: sqlite3_column_text(stmt, 4))
                          let  plate = String(cString: sqlite3_column_text(stmt, 5))
                          let attribute = String(cString: sqlite3_column_text(stmt, 6))
                          let stipend = sqlite3_column_int(stmt, 7)
                          let schoolname = String(cString: sqlite3_column_text(stmt, 8))
                          let salary = sqlite3_column_double(stmt, 9)
                          let commissionpercentage = sqlite3_column_double(stmt, 10)
                          let fixedsalary = sqlite3_column_double(stmt, 11)
                          let hoursworked = sqlite3_column_int(stmt, 12)
                          let rate = sqlite3_column_int(stmt, 13)
                    
                    
                    
                    
                    
                             switch employeementType.selectedSegmentIndex {
                              case 0:
                                  let intern = Intern()
                                  intern.employeeName = name
                                  intern.employeeId = Int(employeeid)
                                  intern.age = Int(age)
                                  intern.internSchoolName = schoolname
                                  intern.stipend = Int(stipend)
                                  if vehicleSeg.selectedSegmentIndex == 0{
                                      intern.vehicle = nil
                                  }else{
                                      if vehicleSeg.selectedSegmentIndex == 0{
                                          let car = Car()
                                          car.make = make
                                          car.plate = plate
                                          car.numberOfSeats = Int(attribute)
                                          intern.vehicle = car
                                      }else {
                                         let  motorcycle = Motorcycle()
                                          motorcycle.make = make
                                          motorcycle.plate = plate
                                          motorcycle.getKerbWeight = Int(attribute)
                                          intern.vehicle = motorcycle
                                      }  }
                                  internArray.append(intern)
                                  break
                              case 1:
                                  let fullTime = FullTimeEmployee()
                                  fullTime.employeeName = name
                                  fullTime.employeeId = Int(employeeid)
                                  fullTime.age = Int(age)
                                  fullTime.salary = Double(salary)
                                  fullTime.bonus = Double(commissionpercentage)
                              if vehicleOption.selectedSegmentIndex == 0{
                                     fullTime.vehicle = nil
                                 }else{
                                      if vehicleSeg.selectedSegmentIndex == 0{
                                          let car = Car()
                                          car.make = make
                                          car.plate = plate
                                          car.numberOfSeats = Int(attribute)
                                          fullTime.vehicle = car
                                     }else {
                                          let motorcycle = Motorcycle()
                                          motorcycle.make = make
                                          motorcycle.plate = plate
                                          motorcycle.getKerbWeight = Int(attribute)
                                          fullTime.vehicle = motorcycle
                                      }  }
                                  fullTimeArray.append(fullTime)
                                  break
                
                
        
                             let fixedPasePartTime = FixedBasePartTime()
                                            
                                            fixedPasePartTime.employeeName = name
                                            fixedPasePartTime.employeeId = Int(employeeid)
                                            fixedPasePartTime.age = Int(age)
                                            fixedPasePartTime.fixedAmount = Int(fixedsalary)
                                            fixedPasePartTime.numberOfHoursWorked = Int(hoursworked)
                                            fixedPasePartTime.rate =  Int(rate)
    
    
        fbptArray.append(fixedPasePartTime)
        break
            default:
            break;
                }
                 
                 }

         }
        
    
    
    @IBAction func btnViewEmployeeDetails(_ sender: Any) {
        
        
        performSegue(withIdentifier: "DisplayVC", sender: self)
    }
         
         
        
         
         
         
         override func prepare(for segue: UIStoryboardSegue, sender: Any?){
             if let displayVCD = segue.destination as? DisplayEmployeeViewController{
                 
                displayVCD.cbptArray = cbptArray
                 displayVCD.fbptArray = fbptArray
                 displayVCD.internArray = internArray
                 displayVCD.fullTimeArray = fullTimeArray
             }
         }
         
         
    }
    
    
    
    
    

