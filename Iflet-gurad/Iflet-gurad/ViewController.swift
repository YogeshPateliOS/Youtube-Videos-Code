//
//  ViewController.swift
//  Iflet-gurad
//
//  Created by Yogesh Patel on 08/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        
        
        
        /*
        var tempName = ""
        if let firstName = firstNameField.text, firstName != ""{
            if let age = ageField.text, age != ""{
                if let city = cityField.text, city != ""{
                    if let email = emailField.text, email != ""{
                        tempName = firstName
                        print("First Name: \(firstName), Age :\(age), City :\(city), Email :\(email)")
                    }else{
                        print("Email is empty")
                    }
                }else{
                    print("City is empty")
                }
            }else{
                print("Age is empty")
            }
        }else{
            print("first name is empty")
        }
        
        print(tempName)
        */
        
        
        
        guard let firstName = firstNameField.text, firstName != "" else {
            print("Firstname is empty")
            return
        }
        guard let age = ageField.text, age != "" else {
            print("age is empty")
            return
        }
        guard let city = cityField.text, city != "" else {
            print("city is empty")
            return
        }
        guard let email = emailField.text, email != "" else {
            print("email is empty")
            return
        }
    
        print("First Name: \(firstName), Age :\(age), City :\(city), Email :\(email)")
    }
    
}

