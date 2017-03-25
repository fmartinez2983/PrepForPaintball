//
//  CreateAcctViewController.swift
//  PrepForPaintball
//
//  Created by FRANCISCO MARTINEZ on 3/19/17.
//  Copyright © 2017 FRANCISCO MARTINEZ. All rights reserved.
//

import UIKit
import Firebase

class CreateAcctViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNCreate: UITextField!
    @IBOutlet weak var emailCreate: UITextField!
    @IBOutlet weak var pwordCreate: UITextField!
    
    let service = Services()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userNCreate.delegate = self
        self.emailCreate.delegate = self
        self.pwordCreate.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func createAcctBtn(_ sender: UIButton) {
        
        createAcct()
        
    }
    
    func createAcct(){
        
        if self.userNCreate.text == "" || self.emailCreate.text == "" || self.pwordCreate.text == "" {
            
            let alertController = UIAlertController(title: "Error", message: "Please Enter Proper Info", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            service.signUp(email: emailCreate.text!, username: userNCreate.text!, password: pwordCreate.text!)
            
            let vcMission = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBar")
            present(vcMission, animated: true, completion: nil);
            
        }
    }
}
