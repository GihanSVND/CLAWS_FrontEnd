//
//  ObjectModel.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-06-21.
//

import Foundation
import UIKit

class objectanimal: Encodable,Decodable{
    var animal: String = ""
    var image : String = ""
    var time : String = ""
    var date : String = ""
}

extension Encodable{
    
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else{
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
    
}


