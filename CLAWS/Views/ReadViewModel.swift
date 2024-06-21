//
//  ReadViewModel.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-06-21.
//

import Foundation
import FirebaseDatabase


class ReadViewModel: ObservableObject{
    
    var ref = Database.database().reference()
    
    @Published
    var value: String? = nil
    
    @Published
    var object: objectanimal? = nil
    
    func readValue(){
        ref.child("detected_animal/animalInfo/animal").observeSingleEvent(of: .value){ snapshot in
            self.value = snapshot.value as? String ?? "Load Faild"
        }
    }
    
    func observeDataChange(){
        ref.child("detected_animal/animalInfo/animal").observe(.value) { snapshot in
            self.value = snapshot.value as? String ?? "Load Faild"
        }
    }
    
    func readObject(){
        ref.child("detected_animal/animalInfo").observe(.value) { snapshot in
            do{
                self.object = try snapshot.data(as: objectanimal.self)
            } catch{
                print("Cannot canvert")
            }
        }
    }
    
}
