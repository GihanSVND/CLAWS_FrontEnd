//
//  ContentView.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-06-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView{
            //Last Detection widget
            ZStack{
                Color(.white)
                    .ignoresSafeArea()
                
                VStack(spacing: -13.0){
                    
                    HStack{
                        Image("CLAWS")
                            .resizable()
                            .frame(width: 65.0, height: 65.0)
                        
                        Spacer()
                        Text("Ongoing Action")
                            .fontWeight(.bold)
                        
                        Image(systemName: "lightbulb.circle.fill")
                            .resizable()
                            .foregroundColor(Color.green)
                            .frame(width: 25.0, height: 25.0)
                        
                    }.padding()
                    
                    VStack(alignment: .leading) {
                        Text("Last Detection")
                            .font(.title)
                            .foregroundColor(Color.white)
                        
                        HStack{
                            VStack(alignment: .leading, spacing: 7.0){
                                Text("2024/05/10")
                                Text("06.32 PM")
                                Text("Elephant")
                            }.foregroundColor(Color.white)
                            
                            Spacer()
                            
                            Image("Elephant")
                                .cornerRadius(10)
                            
                        }
                        
                    }
                    .padding(30)
                    .background(Rectangle())
                    .cornerRadius(17)
                    .padding()
                    
                    //Last update widget
                    VStack(alignment: .leading) {
                        Text("Last Update")
                            .font(.title)
                            .foregroundColor(Color.black)
                        
                        HStack{
                            VStack(alignment: .leading, spacing: 7.0){
                                Text("2024/05/10")
                                    .foregroundColor(Color.black)
                                Text("06.32 PM")
                                    .foregroundColor(Color.black)
                                Button("Request Update") {
                                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.black)
                                
                            }
                            
                            Spacer()
                            
                            Image("Elephant")
                                .cornerRadius(10)
                            
                        }
                        
                    }
                    .padding(30)
                    .background(Rectangle().foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.865)))
                    .cornerRadius(17)
                    .padding()
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Turn ON/OFF")
                                .font(.title2)
                            Text("Action")
                                .font(.title)
                                .fontWeight(.bold)
                        }.foregroundColor(.white)
                        
                        Spacer()
                        
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                            
                        }
                        
                    }.padding(30)
                        .background(Rectangle())
                        .cornerRadius(17)
                        .padding()
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            
                            Text("Change")
                                .font(.title2)
                            Text("the")
                                .font(.title2)
                            Text("Action")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing){
                            HStack{
                                Text("Elephant")
                                
                                Image("Ele")
                                    .resizable()
                                    .frame(width: 65.0, height: 65.0)
                                
                                Image(systemName: "lightbulb.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color.green)
                                    .frame(width: 25.0, height: 25.0)
                            }
                            HStack{
                                Text("Wild-Boar")
                                
                                Image("Wildboar")
                                    .resizable()
                                    .frame(width: 65.0, height: 65.0)
                                
                                Image(systemName: "lightbulb.circle")
                                    .resizable()
                                    .foregroundColor(Color.red)
                                    .frame(width: 25.0, height: 25.0)
                            }
                            HStack{
                                Text("Peacock")
                                
                                Image("Peacock")
                                    .resizable()
                                    .frame(width: 65.0, height: 65.0)
                                
                                Image(systemName: "lightbulb.circle")
                                    .resizable()
                                    .foregroundColor(Color.red)
                                    .frame(width: 25.0, height: 25.0)
                            }
                            HStack{
                                Text("Common")
                                
                                Image("Common")
                                    .resizable()
                                    .frame(width: 65.0, height: 65.0)
                                
                                Image(systemName: "lightbulb.circle")
                                    .resizable()
                                    .foregroundColor(Color.red)
                                    .frame(width: 25.0, height: 25.0)
                            }
                            
                            
                        }
                    }.padding(30)
                        .background(Rectangle().foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.865)))
                        .cornerRadius(17)
                        .padding()
                }
            }
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
