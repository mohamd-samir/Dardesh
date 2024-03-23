//
//  FUserListener.swift
//  Dardesh
//
//  Created by Mohamed on 25/02/2024.
//

import Foundation
import Firebase

//الكلاس المسؤل عن حفظ البيانات الخاصة لليوزر علي الفاير استور
class FUserListener {
    
    static let shared = FUserListener()
    
    private init() {}
    
    
    //MARK: - Login
    
    func loginUserWith(email: String, password: String, completion: @escaping(_ error: Error?, _ isEmailVerified: Bool) -> Void)
    {
        Auth.auth().signIn(withEmail: email, password: password) { (authResults, error) in
            if error == nil && authResults!.user.isEmailVerified{
                completion (error, true)
                self.downloadUserFromFirestore(userId:authResults!.user.uid)
            }else{
                completion(error, false)
            }
        }
    }
    
    //MARK: - Logout
    
    func logoutCurrentUser(completion: @escaping(_ error: Error?) -> Void){
        
        do {
            
          try Auth.auth().signOut()
            userDefaults.removeObject(forKey: kCURRENTUSER)
            userDefaults.synchronize()
            completion(nil)
            
        }catch let error as NSError{
            completion(error)
        }
    }
    
    
    //MARK: - Register
    
    
    func registerUserWith(email: String, password: String, completion: @escaping(_ error: Error?) -> Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { [self] (authResults, error) in
            
            completion(error)
            
            if error == nil {
                
                authResults?.user.sendEmailVerification{ (error) in
                    
                    completion(error)
                }
            }
            
            if authResults?.user != nil {
                let user = User(id: authResults!.user.uid, userName: email, email: email, pushId: "" ,avatarLink: "", status: "Hay, I am using Dardesh")
                
                saveUserToFirestre(user)
                saveUserLocally(user)
            }
        }
    }
    
    //MARK: - Resend link verficiatoin function
    
    func resendVerfivationEmail(email: String, completion: @escaping(_ error: Error?) ->Void){
        Auth.auth().currentUser?.reload(completion: { (error) in
            Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                completion(error)
            })
        })
    }
    
    //علشان لو العنيل نسي كلمة السر
    //MARK: - reset password
    
    func resetPasswordFor(email: String, completion: @escaping(_ error: Error?) ->Void)
    {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            completion(error)
        }
    }
    
    
    private func saveUserToFirestre(_ user: User){
        do{
            try FirestoreReference(.User).document(user.id).setData(from: user)
        } catch{
            print(error.localizedDescription)
        }
    }
    
    
    
    //MARK: - Download user  from firestore
    
    func downloadUserFromFirestore(userId: String){
        
        FirestoreReference(.User).document(userId).getDocument { (document, error)in
            
            guard let userDocument = document else {
                
                print("no data found")
                return
            }
            
            let result = Result{
                
                try? userDocument.data(as: User.self)
            }
            
            switch result{
                
            case .success(let userObject):
                if let user = userObject {
                    saveUserLocally(user)
                }else{
                    print("Document does not exist")
                }
                
            case.failure(let error):
                print("error decoding user", error.localizedDescription)
            }
       
            
            
        }
    }
}
