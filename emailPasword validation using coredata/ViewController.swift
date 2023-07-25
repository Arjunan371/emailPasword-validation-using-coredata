

import UIKit
import CoreData

class ViewController: UIViewController {
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var passwwordText: UITextField!
    @IBOutlet weak var userText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
 
    func showAlert(title:String,Message:String){
        let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default,handler: nil))
        present(alert, animated: true)
    }

    @IBAction func login(_ sender: Any) {
        if passwwordText.text == "" || userText.text == ""{
            showAlert(title: "Try Aain", Message: "entered username and password is invalid")
        }
        else{
            forFetch()
        }
    }
    @IBAction func resister(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "one") as! registerViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    func forFetch(){
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//        do {
//            let fetchRequest: NSFetchRequest<Login> = Login.fetchRequest()
//            let fetchedResults = try context.fetch(fetchRequest)
//
//            // Handle the fetched results
//            for item in fetchedResults {
//                // Access the properties of each fetched item
//                print("Text: \(userText.text ?? "")")
//            }
//        } catch {
//            // Handle the error appropriately
//            print("Error fetching data: \(error)")
//        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let managedContext = appDelegate.persistentContainer.viewContext
                
                
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Login")
        //fetchRequest.predicate = NSPredicate(format: "username = %@", userText.text!)
                
                do {
                    
                 let  fetchData = try managedContext.fetch(fetchRequest)

                    var isLoggedIn = false
                    for item in fetchData{
                    
                         let username = item.value(forKey: "username") as! String
                        let password = item.value(forKey: "password") as! String
                        print(username)
                        print(password)
                        if userText.text == username && passwwordText.text == password{
                            isLoggedIn = true
                            break
                        }
                            
                    }
                    if isLoggedIn{
                        UserDefaults.standard.set(true, forKey: "Login")
                        let homevc = storyboard?.instantiateViewController(withIdentifier: "two") as! homePageViewController
                        navigationController?.pushViewController(homevc, animated: true)
                    }
                    else{
                        print("User not found")
                    }
//                    print(".......\(fetchData.first?.value(forKey: "username"))")
                       

           
                } catch {
                    print("Failed to fetch data:")
                }


            }

        }
    


