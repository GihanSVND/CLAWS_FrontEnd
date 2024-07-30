//
//  Guid02.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-07-29.
//

import SwiftUI

struct Guid02: View {
    var body: some View {
        NavigationView{
            ZStack{
                Text("UPDATES")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .offset(y:-310)
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
                
                HStack(spacing: 0.0){
                    NavigationLink(destination: Guid01(),
                                   label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Text("Back")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    })
                }.offset(x:-150,y:-350)
                                   
                HStack{
                    NavigationLink(destination: Home(),
                                   label: {
                        Text("Skip")
                            .foregroundColor(.black)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    })
                    Spacer()
                    
                    NavigationLink(destination: Guid03(),
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
        }.accentColor(Color(.label))
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    Guid02()
}
