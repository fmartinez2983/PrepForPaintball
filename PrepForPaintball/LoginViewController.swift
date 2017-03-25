//
//  LoginViewController.swift
//  PrepForPaintball
//
//  Created by FRANCISCO MARTINEZ on 3/20/17.
//  Copyright © 2017 FRANCISCO MARTINEZ. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var pwordLogin: UITextField!
    
    let service = Services()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailLogin.delegate = self
        self.pwordLogin.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        
        loginAcct()
        
    }
    
    func loginAcct(){
        
        if self.emailLogin.text == "" || self.pwordLogin.text == "" {
            
            let alertController = UIAlertController(title: "Error", message: "Please Enter Email and/or Password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            service.signInUser(email: emailLogin.text!, password: pwordLogin.text!)
            
            let vcMission = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBar")
            present(vcMission, animated: true, completion: nil);
            
        }
        
        /*if self.emailLogin.text == nil || self.pwordLogin == nil {
            
            let alertController = UIAlertController(title: "Error", message: "Please Enter Proper Info", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }*/

        
    }

}
