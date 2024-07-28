//
//  Guid03.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-07-29.
//

import SwiftUI

struct Guid03: View {
    var body: some View {
        ZStack{
            Text("ACTIONS")
                .font(.largeTitle)
                .fontWeight(.bold)
                .offset(y:-330)
            VStack(alignment: .center){
                Spacer()
                    .frame(height: 61.0)
                Image("Guid03")
                    .resizable()
                    .frame(width: 360, height: 360)
                Spacer()
                    .frame(height: 38.0)
                Text("Turn ON/OFF the Action That Use to Mitigate The Particular Animal at The Movement Manually")
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
                Image(systemName:"circle")
                    .resizable()
                    .frame(width: 10,height: 10)
                    .fontWeight(.bold)
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
            }.offset(y:270)
            
            HStack{
                Button(action: {
                    withAnimation(Animation.bouncy){
                        //go somwhere
                    }
                        }) {
                            Text("Skip")
                                .foregroundColor(.black)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                Spacer()
                
                Button(action: {
                    withAnimation(Animation.bouncy){
                        //go somewhere
                    }
                        }) {
                            HStack{
                                Text("Next")
                                    .foregroundColor(.white)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Image(systemName: "arrow.forward")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    
                            }
                        }
                        .padding(13)
                        .background(Color.black)
                        .cornerRadius(11)
                
            }
            .padding()
            .padding()
            .offset(y:330)
        }
    }
}

#Preview {
    Guid03()
}