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

func RequestUpdate(withId id: String, withID endPoint: String){
    
    guard let url = URL(string: endPoint) else { return }
    
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
    
    @State var toggle: Bool = false
    @State var elephant: Bool = false
    @State var wildboar: Bool = false
    @State var peacock: Bool = false
    @State var common: Bool = false
    
    
    @StateObject
    var viewModel = ReadViewModel()
    
    @State var lastUpdate: Date? = nil
    
    @AppStorage("uId") var userID: String = ""
    var body: some View {
        NavigationView{
            ScrollView{
                //Last Detection widget
                ZStack{
                    Color(.white)
                        .ignoresSafeArea()
                    
                    VStack(spacing: -13.0){
                        
                        HStack{
                            Button(action: {
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
                            }, label: {
                                Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                                    .resizable()
                                    .frame(width: 25.0, height: 25.0)
                                    .rotationEffect(.degrees(180.0))
                                    .accentColor(.black)
                            })
                            
                            Spacer()
                                .frame(width: 31.0)
                            
                            NavigationLink(destination: Guid01(),
                                           label: {
                                Image(systemName: "questionmark.circle.fill")
                                    .resizable()
                                    .frame(width: 25.0, height: 25.0)
                                    .accentColor(.black)
                            })
                            
                            
                            Spacer()
                            
                            if viewModel.object != nil{
                                HStack{
                                    Text(toggle == true ? "Ongoing Action" : "No Action")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black)
                                    Image(systemName:toggle == true ? "lightbulb.circle.fill" : "lightbulb.circle")
                                        .resizable()
                                        .foregroundColor(toggle == true ? Color.green : Color.red)
                                        .frame(width: 25.0, height: 25.0)
                                }
                            }
                            
                            
                        }.padding()
                        
                        Image("CLAWS")
                            .resizable()
                            .frame(width: 75.0, height:75.0)
                            .offset(y:-10)
                        
                        VStack(alignment: .leading) {
                            Text("Last Update")
                                .font(.title)
                                .foregroundColor(Color.white)
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 7.0){
                                    if viewModel.object != nil{
                                        Text(viewModel.object!.date)
                                    }
                                    if viewModel.object != nil{
                                        Text(viewModel.object!.time)
                                    }
                                    HStack{
                                        if viewModel.object != nil {
                                            Text(viewModel.object!.animal)
                                                .font(.title)
                                                .fontWeight(.bold)
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
                            var dateFormatter: DateFormatter{
                                let formatter = DateFormatter()
                                formatter.dateStyle = .short
                                formatter.timeStyle = .short
                                return formatter
                            }
                            
                        }
                        .padding(30)
                        .background(Rectangle().foregroundColor(.black))
                        .cornerRadius(17)
                        .padding()
                        
                        
                        Button{
                            viewModel.updateRequest()
                        } label: {
                            Text("Request Update")
                                .fontWeight(.bold)
                                .padding()
                                .padding(.horizontal, 97.0)
                                .foregroundColor(.black)
                                .background(Rectangle().foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.865)))
                                .cornerRadius(17)
                            
                        }.padding()
                        
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("Turn ON/OFF")
                                    .font(.title2)
                                Text("Action")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }.foregroundColor(.white)
                            
                            Spacer()
                            if viewModel.object != nil{
                                Toggle(isOn: $toggle){
                                    
                                }
                                .onChange(of: viewModel.object!.animal) {
                                    if viewModel.object!.animal == "none"{
                                        toggle = false
                                    } else{
                                        toggle = true
                                    }
                                }
                                
                            }
                            
                            
                        }
                        .padding(30)
                        .background(Rectangle())
                        .foregroundColor(.black)
                        .cornerRadius(17)
                        .padding()
                        
                        if (toggle){
                            
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
                                
                                VStack(spacing: 10){
                                    
                                    
                                    Toggle(isOn: $elephant, label: {
                                        HStack(alignment: .center){
                                            VStack(spacing:2){
                                                Text("Elephant")
                                                    .foregroundColor(Color.black)
                                                    .multilineTextAlignment(.leading)
                                                
                                                Image("Ele")
                                                    .resizable()
                                                    .frame(width: 65.0, height: 65.0)
                                            }
                                        }
                                    }).toggleStyle(.button)
                                        .onChange(of: elephant){
                                            if elephant == true{
                                                viewModel.changeAction(animalChange: "elephant")
                                                wildboar = false
                                                peacock = false
                                                common = false
                                            }
                                        }
                                        .tint(.green)
                                    
                                    
                                    Toggle(isOn: $wildboar, label: {
                                        HStack(alignment: .center){
                                            VStack(spacing:2){
                                                Text("Wild-Boar")
                                                    .foregroundColor(Color.black)
                                                    .multilineTextAlignment(.leading)
                                                
                                                Image("Wildboar")
                                                    .resizable()
                                                    .frame(width: 65.0, height: 65.0)
                                            }
                                        }
                                    }).toggleStyle(.button)
                                        .onChange(of: wildboar){
                                            if wildboar == true{
                                                viewModel.changeAction(animalChange: "wildboar")
                                                elephant = false
                                                peacock = false
                                                common = false
                                            }
                                        }
                                        .tint(.green)
                                    
                                    Toggle(isOn: $peacock, label: {
                                        HStack(alignment: .center){
                                            VStack(spacing:2){
                                                Text("Peacock")
                                                    .foregroundColor(Color.black)
                                                    .multilineTextAlignment(.leading)
                                                
                                                Image("Peacock")
                                                    .resizable()
                                                    .frame(width: 65.0, height: 65.0)
                                            }
                                        }
                                    }).toggleStyle(.button)
                                        .onChange(of: peacock){
                                            if peacock == true{
                                                viewModel.changeAction(animalChange: "peacock")
                                                elephant = false
                                                wildboar = false
                                                common = false
                                            }
                                        }
                                        .tint(.green)
                                    
                                    
                                    Toggle(isOn: $common, label: {
                                        HStack(alignment: .center){
                                            VStack(spacing:2){
                                                Text("Common")
                                                    .foregroundColor(Color.black)
                                                    .multilineTextAlignment(.leading)
                                                
                                                Image("Common")
                                                    .resizable()
                                                    .frame(width: 65.0, height: 65.0)
                                            }
                                        }
                                    }).toggleStyle(.button)
                                        .onChange(of: common){
                                            if common == true{
                                                viewModel.changeAction(animalChange: "common")
                                                elephant = false
                                                wildboar = false
                                                peacock = false
                                            }
                                        }
                                        .tint(.green)
                                    
                                }
                            }.padding(30)
                                .background(Rectangle().foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.865)))
                                .cornerRadius(17)
                                .padding()
                            
                        }
                    }.onChange(of: toggle){
                        if toggle == true{
                            viewModel.makeActionOnOff(animalChange: "1")
                        } else if toggle == false {
                            viewModel.makeActionOnOff(animalChange: "0")
                        }
                    }
                }.onAppear {
                    viewModel.readObject()
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
