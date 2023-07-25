//
//  homePageViewController.swift
//  emailPasword validation using coredata
//
//  Created by Mohammed Abdullah on 12/07/23.
//

import UIKit
import CoreData
class homePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Logout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "Login")
        let vc = storyboard?.instantiateViewController(withIdentifier: "Login") as! ViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
