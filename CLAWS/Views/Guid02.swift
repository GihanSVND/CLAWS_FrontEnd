//
//  Guid02.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-07-29.
//

import SwiftUI

struct Guid02: View {
    @State var appeared: Double = 0.0
    var body: some View {
        
            ZStack{
                Text("UPDATES")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .offset(y:-350)
                VStack(alignment: .center){
                    Spacer()
                        .frame(height: 61.0)
                    Image("Guid02")
                        .resizable()
                        .frame(width: 400, height: 400)
                    Spacer()
                        .frame(height: 38.0)
                    
                    
                    Spacer()
                        .frame(height: 88.0)
                    
                }
                .padding()
                .frame(alignment: .top)
                HStack {
                    Image(systemName:"circle")
                        .resizable()
                        .frame(width: 10,height: 10)
                        .fontWeight(.bold)
                    Image(systemName:"circle.fill")
                        .resizable()
                        .frame(width: 10,height: 10)
                        .fontWeight(.bold)
                    Image(systemName:"circle")
                        .resizable()
                        .frame(width: 10,height: 10)
                        .fontWeight(.bold)
                    Image(systemName:"circle")
                        .resizable()
                        .frame(width: 10,height: 10)
                        .fontWeight(.bold)
                }.offset(y:270)
                
                
                HStack{
                    NavigationLink(destination: Home()
                        .transition(.identity),
                                   label: {
                        Text("Skip")
                            .foregroundColor(.black)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    })
                    Spacer()
                    
                    NavigationLink(destination: Guid03()
                        .transition(.identity),
                                   label: {
                        HStack{
                            Text("Next")
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Image(systemName: "arrow.forward")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            
                        }.padding(13)
                            .background(Color.black)
                            .cornerRadius(11)
                    })
                }
                .padding()
                .padding()
                .padding()
                .offset(y:330)
            }
        
        
    }
}

#Preview {
    Guid02()
}
