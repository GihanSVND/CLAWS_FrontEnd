//
//  CLAWSApp.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-06-16.
//

import SwiftUI
import Firebase

@main
struct CLAWSApp: App {
    
    init() {
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
