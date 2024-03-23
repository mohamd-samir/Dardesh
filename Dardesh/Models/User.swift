//
//  User.swift
//  Dardesh
//
//  Created by Mohamed on 20/02/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct User: Codable {
    
    var id = ""
    var userName: String
    var email: String
    var pushId = ""
    var avatarLink = ""
    var status: String
    
    static var currentUser: User? {
        
        if Auth.auth().currentUser != nil {
            
            if let data = userDefaults.data(forKey: kCURRENTUSER){
                
                let decoder = JSONDecoder()
                
                do{
                    let userbject = try decoder.decode(User.self, from: data)
                    
                    return userbject
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        return nil
    }
    
}

func saveUserLocally(_ user: User){
    
    let econder = JSONEncoder()
    
    do {
        let data = try econder.encode(user)
        
        userDefaults.set(data, forKey: kCURRENTUSER)
    }catch {
        print(error.localizedDescription)
    }

    

    
}
