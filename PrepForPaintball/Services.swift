//
//  Services.swift
//  PrepForPaintball
//
//  Created by FRANCISCO MARTINEZ on 3/22/17.
//  Copyright © 2017 FRANCISCO MARTINEZ. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

struct Services {
    
    var dbRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }

    var storRef: FIRStorageReference {
        return FIRStorage.storage().reference()
    }
    
    private func saveInfo(user: FIRUser!, username: String, password: String){
        
        let userInfo = ["email": user.email, "username": username, "uid": user.uid]
        
        let userRef = dbRef.child("users").child(user.uid)
        
        userRef.setValue(userInfo)
        
        signInUser(email: user.email!, password: password)
        
    }
    
    func signInUser(email:String, password:String){
    
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error == nil {
                
                if let user = user {
                    
                    print("\(user.displayName) signed in")
                    
                }
                
            } else {
                
                print(error!.localizedDescription)
                
            }
        
        })
    
    }
    
   private func setUserInfo(user: FIRUser!, username: String, password: String/*, data:NSData*/){
        
//        let metaData = FIRStorageMetadata()
        
//        metaData
    
        let changeReq = user.profileChangeRequest()
        changeReq.displayName = username
        changeReq.commitChanges(completion: {(error) in
    
            if error == nil {
            
                self.saveInfo(user: user, username: username, password: password)
            
            } else {
            
                print(error!.localizedDescription)
            
            }
    
        })
        
    }
    
    func signUp(email:String, username: String, password: String/*, data:NSData*/){
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user, error) in
        
            if error == nil {
                
                self.setUserInfo(user: user, username: username, password: password)
                
            } else {
                
                print(error!.localizedDescription)
                
            }
        
        })
        
    }
    
}

