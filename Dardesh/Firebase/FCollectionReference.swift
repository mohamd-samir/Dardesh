//
//  FCollectionReference.swift
//  Dardesh
//
//  Created by Mohamed on 20/02/2024.
//

import Foundation
import Firebase

enum FCollectionReference: String {
    
    case User
}
    
func FirestoreReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}


