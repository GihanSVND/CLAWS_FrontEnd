//
//  Guid01.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-07-28.
//

import SwiftUI

struct Guid01: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                Text("CLAWS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .offset(y:-310)
                VStack(alignment: .center){
                    Spacer()
                        .frame(height: 61.0)
                    Image("Guid01")
                        .resizable()
                        .frame(width: 350, height: 350)
                    Spacer()
                        .frame(height: 38.0)
                    Text("CLAWS is a Advanced System That Uses Cutting Edge Technologies For Mitigate Animals From Civilized Lands Without any Harm for Both Humans & Animals")
                        .font(.body)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Spacer()
                        .frame(height: 88.0)
                    
                }
                .padding()
                .frame(alignment: .top)
                
                HStack {
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
                    Image(systemName:"circle")
                        .resizable()
                        .frame(width: 10,height: 10)
                        .fontWeight(.bold)
                }.offset(y:270)
                
                HStack{
                    NavigationLink(destination: Home(),
                                   label: {
                        Text("Skip")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    })
                    
                    Spacer()
                    NavigationLink(destination: Guid02(),
                                   label: {
                        HStack{
                            Text("Next")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
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
                .offset(y:330)
            }
        }.accentColor(Color(.label))
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Guid01()
}
