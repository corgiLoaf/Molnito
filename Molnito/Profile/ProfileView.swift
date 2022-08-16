//
//  ProfileView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/16.
//

import SwiftUI

struct ProfileView: View {
    @State var nickname: String = ""
    
    var body: some View {
        VStack{
            
            editButton
                .padding(.trailing)
            
            Image("appleLogo")
                .resizable()
                .frame(width: 140, height: 140)
                .clipShape(Circle())
            //.padding(.top, 30)
            
            //            Image(systemName: "person")
            //                .frame(width: 150, height:150)
            
            //Spacer()
            
            // Name, Nickname
            VStack(spacing:  20){
                Text("Tim Cook")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                HStack(alignment: .center)
                {
                    
                    Text("애플 짱")
                        .font(.title3)
                        .bold()
                }
                .padding()
                
            }
            
            HStack{
                
                Text("Group List")
                    .font(.title2)
                    .foregroundColor(Color("hanyangBlue"))
                    .fontWeight(.bold)
                    .padding(.leading)
                
                Spacer()
            }
            .padding(.top)
            .padding(.bottom)
            
            Divider()
                .frame(height: 1)
                .overlay(Color(.gray))
                .shadow(color: .gray, radius: 5, x: 0, y:0)
            
            ScrollView{
                LazyVStack {
                    ForEach(0 ... 5, id: \.self){ _ in
                        GroupRowView()
                    }
                }
            }
            .padding()
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView{
    var editButton: some View{
        HStack {
            Spacer()
             
            Button{
                // action here
            } label: {
                Text("Edit")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                    .frame(width: 60, height: 30)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
            }
        }
        
    }
}
