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
    
    func changeAction(animalChange: String) {
            let updateData: [String: Any] = [
                "ChangedAnimal": animalChange
            ]
            
            ref.child("RequestUpdate/animalUpdate").setValue(updateData) { error, _ in
                if let error = error {
                    print("Data could not be saved: \(error.localizedDescription)")
                } else {
                    print("Data saved successfully!")
                }
            }
        }
    
    func updateRequest() {
        let updateReq: [String: Any] = [
            "Update": "1"
        ]
        
        ref.child("RequestUpdate").setValue(updateReq) { error, _ in
            if let error = error {
                print("Data could not be saved: \(error.localizedDescription)")
            } else {
                print("Data saved successfully!")
                
                // Change to "Update": "2" after 10 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    let updateReqAfterDelay: [String: Any] = [
                        "Update": "0"
                    ]
                    
                    self.ref.child("RequestUpdate").setValue(updateReqAfterDelay) { error, _ in
                        if let error = error {
                            print("Data could not be updated to '2': \(error.localizedDescription)")
                        } else {
                            print("Data updated to '2' successfully!")
                        }
                    }
                }
            }
        }
    }
    
    func makeActionOnOff(animalChange: String) {
            let updateData: [String: Any] = [
                "Action": animalChange
            ]
            
            ref.child("RequestUpdate").setValue(updateData) { error, _ in
                if let error = error {
                    print("Data could not be saved: \(error.localizedDescription)")
                } else {
                    print("Data saved successfully!")
                }
            }
        }
    
}
