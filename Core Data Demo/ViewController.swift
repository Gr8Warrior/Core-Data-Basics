//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Shailendra Suriyal on 16/01/17.
//  Copyright © 2017 RealDev. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //it refers to the AppDelegate file present in the system
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //Create Context that helps to save and retrieve entities in Core data
        let context = appDelegate.persistentContainer.viewContext
        
        // To Save the Data
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Gillie", forKey: "userName")
        newUser.setValue("abc123", forKey: "password")
        newUser.setValue(3, forKey: "age")
        
        do{
            
            try context.save()
            
            print("Saved")
        
        } catch {
        
            print("There was an error")
        }
        
        
        //To search the data using required field
        let request = NSFetchRequest<NSFetchRequestResult>(entityName : "Users")
        
        //Filter based on predicate which is equivalent to sql's where clause
        request.predicate = NSPredicate(format: "userName = %@", "rohan")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let userName = result.value(forKey: "userName") as? String {
                        
                        print("UserName :- \(userName)")

                        //To Delete the data
                        
//                        context.delete(result)
//                        do {
//                            
//                            try context.save()
//                            
//                        } catch {
//                            print("Delete Fails")
//                        }
  
                        //To Update a particular Data
                        
//                        result.setValue("Dona", forKey: "userName")
                        
//                        do {
//                            
//                            try context.save()
//                        
//                        } catch {
//                            print("Rename Fails")
//                        }
                        
                    }
                    
                }
                
            } else {
                
                print("No results")
                
            }
            
            
        } catch {
            
            print("There was an error")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

