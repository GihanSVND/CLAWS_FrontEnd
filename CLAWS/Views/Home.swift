//
//  Home.swift
//  CLAWS
//
//  Created by Gihan Savinda on 2024-06-20.
//

import SwiftUI
import FirebaseAuth

struct Response: Codable{
    var id:String
}

func convertImage(base64img : String) -> UIImage{
    let imageData = Data(base64Encoded: base64img)
    let image = UIImage(data: imageData!)
    
    return image!
}

func RequestUpdate(withId id: String){
    
    guard let url = URL(string: "https://0e343f79-2075-47d9-a6f8-eb71a020257a.mock.pstmn.io/success") else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let response = Response(id: id)
    
    do{
        let jsondata = try JSONEncoder().encode(response)
        request.httpBody = jsondata
    }
    catch{
        print("Failed to encode JSON: \(error)")
                return
    }
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response")
                return
            }

            if let data = data {
                print("Response data: \(String(data: data, encoding: .utf8) ?? "No data")")
            }
        }
        
        task.resume()
    }

struct Home: View {
    
    @StateObject
    var viewModel = ReadViewModel()
    
    @AppStorage("uId") var userID: String = ""
    var body: some View {
        
        ScrollView{
            //Last Detection widget
            ZStack{
                Color(.white)
                    .ignoresSafeArea()
                
                VStack(spacing: -13.0){
                    
                    HStack{
                        
                        Button {
                            let firebaseAuth = Auth.auth()
                            do {
                                try firebaseAuth.signOut()
                                    withAnimation {
                                        withAnimation {
                                            userID = ""
                                        }
                                    }
                                
                                
                            } catch let signOutError as NSError {
                              print("Error signing out: %@", signOutError)
                            }
                        } label: {
                            Image("CLAWS")
                                .resizable()
                                .frame(width: 65.0, height: 65.0)
                        }

                        
                        Spacer()
                        Text("Ongoing Action")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        
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
                                HStack{
                                    if viewModel.object != nil {
                                        Text(viewModel.object!.animal)
                                            .foregroundColor(Color.green)
                                            
                                    }
                                }
                                
                            }.foregroundColor(Color.white)
                            
                            Spacer()
                            if viewModel.object != nil{
                                Image(uiImage: convertImage(base64img: viewModel.object!.image))
                                    .resizable()
                                    .frame(width: 150.0, height: 150.0)
                                    .cornerRadius(10)
                                    
                            }
                        }
                        
                    }
                    .padding(30)
                    .background(Rectangle().foregroundColor(.black))
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
                                    RequestUpdate(withId: "update")
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
                        
                    }
                    .padding(30)
                    .background(Rectangle())
                    .foregroundColor(.black)
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
                        }.foregroundColor(.black)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing){
                            Button(action: {
                                RequestUpdate(withId: "Elephant")
                                        }) {
                                            HStack{
                                                Text("Elephant")
                                                    .foregroundColor(Color.black)
                                                
                                                Image("Ele")
                                                    .resizable()
                                                    .frame(width: 65.0, height: 65.0)
                                                
                                                Image(systemName: "lightbulb.circle")
                                                    .resizable()
                                                    .foregroundColor(Color.red)
                                                    .frame(width: 25.0, height: 25.0)
                                            }
                                        }
                            Button(action: {
                                RequestUpdate(withId: "WildBoar")
                                        }) {
                                            HStack{
                                                Text("Wild-Boar")
                                                    .foregroundColor(Color.black)
                                                
                                                Image("Wildboar")
                                                    .resizable()
                                                    .frame(width: 65.0, height: 65.0)
                                                
                                                Image(systemName: "lightbulb.circle")
                                                    .resizable()
                                                    .foregroundColor(Color.red)
                                                    .frame(width: 25.0, height: 25.0)
                                            }
                                        }
                            Button(action: {
                                RequestUpdate(withId: "Peacock")
                                        }) {
                                            HStack{
                                                Text("Peacock")
                                                    .foregroundColor(Color.black)
                                                
                                                Image("Peacock")
                                                    .resizable()
                                                    .frame(width: 65.0, height: 65.0)
                                                
                                                Image(systemName: "lightbulb.circle")
                                                    .resizable()
                                                    .foregroundColor(Color.red)
                                                    .frame(width: 25.0, height: 25.0)
                                            }
                                        }
                            
                            Button(action: {
                                RequestUpdate(withId: "Common")
                                        }) {
                                            HStack{
                                                Text("Common")
                                                    .foregroundColor(Color.black)
                                                
                                                Image("Common")
                                                    .resizable()
                                                    .frame(width: 65.0, height: 65.0)
                                                
                                                Image(systemName: "lightbulb.circle")
                                                    .resizable()
                                                    .foregroundColor(Color.red)
                                                    .frame(width: 25.0, height: 25.0)
                                            }
                                        }
                            
                            
                            
                        }
                    }.padding(30)
                        .background(Rectangle().foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.865)))
                        .cornerRadius(17)
                        .padding()
                        .onAppear {
                                    viewModel.readObject()
                            
                                }
                }
            }
            
            
        }
    }
}

#Preview {
    Home()
}
