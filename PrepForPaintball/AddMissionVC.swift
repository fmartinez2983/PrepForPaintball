//
//  AddMissionVC.swift
//  PrepForPaintball
//
//  Created by FRANCISCO MARTINEZ on 12/28/16.
//  Copyright © 2016 FRANCISCO MARTINEZ. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class AddMissionVC: UIViewController{
    
    @IBOutlet weak var missionName: UITextField!
    @IBOutlet weak var missionObj: UITextField!
    
    var databref: FIRDatabaseReference! {
        
        return FIRDatabase.database().reference()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveMission(_ sender: UIButton) {
        
        let missionRef = databref.child("missions").childByAutoId()
        let mission = Missions(mName: <#T##String#>, mObjective: <#T##String#>)
        
    }
}
