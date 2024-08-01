//
//  Guid03.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-07-29.
//

import SwiftUI

struct Guid03: View {
    @State var appeared: Double = 0.0
    var body: some View {
        NavigationView{
            ZStack{
                Text("ACTIONS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .offset(y:-350)
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
                
                HStack(spacing: 0.0){
                    NavigationLink(destination: Guid02(),
                                   label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Text("Back")
                    })
                }.offset(x:-160,y:-400)
                
                HStack{
                    NavigationLink(destination: Home(),
                                   label: {
                        Text("Skip")
                            .foregroundColor(.black)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    })
                    Spacer()
                    
                    NavigationLink(destination: Guid04(),
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
                .offset(y:330)
            }.opacity(appeared)
                .animation(Animation.easeInOut(duration: 2.0), value: appeared)
                .onAppear {self.appeared = 1.0}
                .onDisappear {self.appeared = 0.0}
        }.accentColor(Color(.label))
        .navigationBarBackButtonHidden(true)
        .transition(.identity)
    }
}

#Preview {
    Guid03()
}
