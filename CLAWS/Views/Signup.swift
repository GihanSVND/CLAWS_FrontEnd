//
//  Signup.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-06-20.
//

import SwiftUI
import FirebaseAuth

struct Signup: View {
    
    @Binding var currentView: String
    
    @State private var email: String = ""
    @State private var password: String = ""
    @AppStorage("uId") var userID: String = ""
    
    var body: some View {
        
        ZStack{
            Color(.white)
                .ignoresSafeArea()
            
            Image("Field")
                .resizable()
                .ignoresSafeArea()
            
            Color(.white)
                .ignoresSafeArea()
                .opacity(0.6)
            
            VStack(spacing:30){
                
                Text("Create an Account!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(0.0)
                    .offset(y:-50)
                    
                HStack{
                    Image(systemName: "person.fill")
                    
                    TextField("Email", text: $email)
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty){
                            Text("Email")
                                .foregroundColor(.black)
                                .bold()
                        }
                    Spacer()
                    if(email.count != 0){
                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                    
                }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 16)
                        .stroke(lineWidth: 2))
                    
                
                
                
                HStack{
                    Image(systemName: "lock.fill")
                    
                    SecureField("Password", text: $password)
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
                        .placeholder(when: password.isEmpty){
                            Text("Password")
                                .foregroundColor(.black)
                                .bold()
                        }
                    Spacer()
                    if(password.count != 0){
                        Image(systemName: password.isValidPssword(password) ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(password.isValidPssword(password) ? .green : .red)
                    }
                    
                
                }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 16)
                        .stroke(lineWidth: 2))
                
                Button{
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let error = error{
                            print(error)
                            return
                        }
                        
                        if let authResult = authResult{
                            print(authResult.user.uid)
                            withAnimation {
                                userID = authResult.user.uid
                            }
                        }
                    }
                } label: {
                    Text("Register")
                        .padding()
                        .padding(.horizontal, 125.0)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }.offset(y:40)
                
                Button{
                    withAnimation{
                        self.currentView = "login"
                    }
                } label: {
                    Text("Already have an account? Register")
                        .foregroundColor(.black)
                        .bold()
                        
                }.offset(y:50)
                    
            }
            .padding()
        }
    }
}


