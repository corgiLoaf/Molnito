//
//  RegisterView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/16.
//

import SwiftUI

struct RegisterView: View {
    @State private var id = ""
    @State private var password = ""
    @State private var name = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            
            //header
             VStack(alignment: .leading){
                 
                 HStack{ Spacer()} // fetch to full width
                 
                 Text("Get Started")
                     .font(.largeTitle)
                     .fontWeight(.semibold)
                 Text("Create Your Account")
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
                CustomInptField(imageName: "person", placeHolderText: "Enter your name", text: $name)
                
                //TextField("ID", text: $id)
                CustomInptField(imageName: "person.circle", placeHolderText: "Enter your id", text: $id)
                
                //TextField("Password", text: $password)
                CustomInptField(imageName: "lock", placeHolderText: "Enter your password", text: $id)
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            
            // Button
            Button {
                print("Sign in here..")
            } label:{
                Text("Sign Up")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color("hanyangBlue"))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.7), radius: 7, x: 0, y: 0)
            
            Spacer()
            
            // Transition to login view
            Button{
                presentationMode.wrappedValue.dismiss()
            } label :{
                Text("Already have an account?")
                    .font(.footnote)
                
                Text("Sign In")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color("hanyangBlue"))
            }
            .padding(.bottom , 25)
            
            //presentationMode
    
        }.ignoresSafeArea()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
