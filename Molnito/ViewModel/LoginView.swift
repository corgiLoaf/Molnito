//
//  LoginView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/16.
//

import SwiftUI

struct LoginView: View {
    //@ObservedObject var userViewModel = UserViewModel()
    @State var userToken = "2"
    @State private var id = ""
    @State private var password = ""
    @State var isactive = false;
    var body: some View {
        // top container
            NavigationView{
            VStack{
               //header
                VStack(alignment: .leading){
                
                    HStack{ Spacer()} // fetch to full width
                    
                    Text("Hello,")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                .frame(height: 260)
                .padding()
                .foregroundColor(.white)
                .background(Color("hanyangBlue"))
                .clipShape(RoundShape(corners: [.bottomRight]))
                
                // text field
                VStack(spacing: 40){
                    //TextField("ID", text: $id)
                    CustomInptField(imageName: "person.circle", placeHolderText: "Enter your id", text: $id)
                    
                    //TextField("Password", text: $password)
                    CustomInptField(imageName: "lock", placeHolderText: "Enter your password", text: $password)
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                // forgot Password?
                HStack{
                    Spacer()
                    
                    NavigationLink{
                        //Main_Page(userToken:$usertoken)
                        Text("Reset Password view")
                    } label: {
                        Text("Forgot Password?")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(Color("hanyangBlue"))
                    }
                }
                
                NavigationLink(destination: Main_Page(userToken: $userToken),isActive: $isactive, label: {
                Button{
                    //userViewModel.setUser_id(id)
                    //userViewModel.setUser_pwd(password)
                    print("log in")
                    //loadUserData(userViewModel : userViewModel)
                    isactive = true;
                } label:{
                    Text("Sign In")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color("hanyangBlue"))
                        .clipShape(Capsule())
                        .padding()
                }
                    .shadow(color: .gray.opacity(0.7), radius: 7, x: 0, y: 0)})
                
                
                
                Spacer()
                
                NavigationLink{
                    RegisterView()
                        .navigationBarHidden(true)
                } label :{
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color("hanyangBlue"))
                }
                .padding(.bottom , 25)
            }
            .ignoresSafeArea() // screen의 safe area까지 꽉 채움
        .navigationBarHidden(true)
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//
//func loadUserData(userViewModel:UserViewModel){
//    guard let url = URL(string : "http://192.249.18.198:80/login")else{
//        print("wrong URL")
//        return
//    }
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST";
//
//    let encoder = JSONEncoder()
//    encoder.outputFormatting = .prettyPrinted
//    let data = try! encoder.encode(userViewModel.userModel)
//
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    request.httpBody = data
//
//    URLSession.shared.dataTask(with: request) { data, _, _ in
//        guard let data = data else {
//            return
//        }
//        do {
//            // 3
//            let results = try JSONDecoder().decode(result.self, from: data)
//
//            DispatchQueue.main.async {
//                userViewModel.setName(results.user_name)
//                userViewModel.setToken(results.token)
//                userViewModel.setNickname(results.nickname)
//                print("\(userViewModel.userModel.token) nick \(userViewModel.userModel.nickname)")
//            }
//        } catch {
//            print("\(error.localizedDescription)\n\(error)")
//        }
//
//
//    }.resume()
//}
        
