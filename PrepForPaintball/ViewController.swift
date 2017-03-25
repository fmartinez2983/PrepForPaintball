//
//  ViewController.swift
//  PrepForPaintball
//
//  Created by FRANCISCO MARTINEZ on 12/25/16.
//  Copyright © 2016 FRANCISCO MARTINEZ. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cdTimer: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//    @IBAction func stopClock(_ sender: UIButton) {
//        
//        let alert = UIAlertController(title: "Stop Clock", message: "Do you want to stop clock?", preferredStyle: UIAlertControllerStyle.alert)
//        
//        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: nil))
//        
//        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
//        
//        self.present(alert, animated: true, completion: nil)
//        
//    }
    
    @IBAction func logOutBtn(_ sender: UIBarButtonItem) {
        
        if FIRAuth.auth()?.currentUser != nil {
            
            do {
                
                try FIRAuth.auth()?.signOut()
                
                let vcMission = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Accounts")
                present(vcMission, animated: true, completion: nil);
                
            } catch let error as NSError {
                
                print(error.localizedDescription)
                
            }
            
        }
    }
}

