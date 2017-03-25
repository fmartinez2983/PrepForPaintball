//
//  Missions.swift
//  PrepForPaintball
//
//  Created by FRANCISCO MARTINEZ on 3/23/17.
//  Copyright © 2017 FRANCISCO MARTINEZ. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Missions {
    
    var mName: String!
    var mObjective: String!
    var ref: FIRDatabaseReference?
    var key: String!
    
    init(mName: String, mObjective: String, key: String = ""){
    
        self.mName = mName
        self.mObjective = mObjective
        self.key = key
        self.ref = FIRDatabase.database().reference()
        
    }
    
    init(snapshot: FIRDataSnapshot){
        
/*        self.mName = snapshot.value!["mName"] as! String
        self.mObjective = snapshot.value!["mObjective"] as! String
        self.mTime = snapshot.value!["mTime"] as! [Double]
        self.key = snapshot.key
        self.ref = snapshot.ref*/
        
        let values = snapshot.value as! Dictionary<String, String>
        mName = values["mName"]
        mObjective = values["mObjective"]
        
    }
    
    func toAnyObj() -> [String: AnyObject] {
    
        return ["mName": mName as AnyObject, "mObjective": mObjective as AnyObject]
    
    }
}
