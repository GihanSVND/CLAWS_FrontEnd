//
//  Authview.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-06-20.
//

import SwiftUI

struct Authview: View {
    @State private var currentView: String = "login"
    
    var body: some View {
        
        if(currentView == "login"){
            Login(currentView: $currentView)
        }else{
            Signup(currentView: $currentView)
        }
    }
}

#Preview {
    Authview()
}
