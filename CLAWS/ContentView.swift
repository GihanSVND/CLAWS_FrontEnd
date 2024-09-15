//
//  ContentView.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-06-16.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("uId") var userID: String = ""
    
    var body: some View {
        
        if userID == ""{
            Authview()
        }else{
            Home()
        }
        
    }
}

#Preview {
    ContentView()
}
