//
//  registerViewController.swift
//  emailPasword validation using coredata
//
//  Created by Mohammed Abdullah on 12/07/23.
//

import UIKit
import CoreData

class registerViewController: UIViewController {
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var passwordtxt: UITextField!
    @IBOutlet weak var emailtxt: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@gmail.com"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isPassword(_ password: String) -> Bool {
        //At least 8 characters
        if password.count < 8 {
            return false
        }

        //At least one digit
        if password.range(of: #"\d+"#, options: .regularExpression) == nil {
            return false
        }

        //At least one letter
        if password.range(of: #"\p{Alphabetic}+"#, options: .regularExpression) == nil {
            return false
        }

        //No whitespace charcters
        if password.range(of: #"\s+"#, options: .regularExpression) != nil {
            return false
        }

        return true
    }
    
    func showAlert(title:String,Message:String){
        let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default,handler: nil))
        present(alert, animated: true)
    }

    @IBAction func Reister(_ sender: Any) {
        if isValidEmail(emailtxt.text!) == true && isPassword(passwordtxt.text!) == true{
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let managed = appdelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Login", in: managed)
            let obj = NSManagedObject(entity: entity!, insertInto: managed)
            
            obj.setValue(emailtxt.text, forKey: "username")
            obj.setValue(passwordtxt.text, forKey: "password")
            
            
            do{
                
                try managed.save()
                
                print("save")
                print(try managed.save())
                
                
            }
            catch {
                print(error)
            }
            navigationController?.popViewController(animated: true)
        }
        else if emailtxt.text == "" || passwordtxt.text == "" {
            showAlert(title: "Try again", Message: "enter username and password")
        }
        else{
            showAlert(title: "Alert", Message: "enter email and password is invalid")
        }
        
            }
            
    }
    


