//
//  Room_Create_Enter.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/15.
//

import SwiftUI

struct Room_Create_Enter: View {
    @Binding var is_popup : Bool // 버튼 클릭시 true로
    @Binding var userToken : String
    @State var isactive = false;
    var body: some View {
        HStack(alignment: .center, spacing: 30)
        {
            NavigationLink(destination: startmakeGroup(),isActive: $isactive, label:{
            Button(action:{
                print("CREATE ROOM")
                isactive = true
            }){
                VStack(spacing:-9){
                    Image("Lion")
                        .resizable()
                        .frame(width: 100, height: 100)
                    VStack(
                        alignment: .center,
                        spacing: 50
                    ){
                        
                        Text("방 만들기")
                            .font(.headline)
                        
                        Text("마니또 시작하기")
                            .font(.system(size:10))
                            .lineLimit(1)
                        
                        
                    }   .padding(.all)
                        .frame(width: 120, height: 130)
                        .overlay(RoundedRectangle(cornerRadius:5)
                        .stroke(Color.black, lineWidth: 2))
                }
            }})
            Button(action:{
                is_popup = true
                print("ENTER ROOM")
            }){
                VStack(spacing:-12){
                    Image("Tiger")
                        .resizable()
                        .frame(width: 100, height: 100)
                    VStack(
                        alignment: .center,
                        spacing: 50
                    ){
                        Text("방 입장하기")
                            .font(.headline)
                            
                        Text("입장 코드 입력하기")
                            .font(.system(size:10))
                            .lineLimit(1)
                    }   .padding(.all)
                        .frame(width: 120, height: 130)
                        .overlay(RoundedRectangle(cornerRadius:5)
                        .stroke(Color.black, lineWidth: 2))
                }
            }/*
            .popover(isPresented: $is_popup){
                Room_Enter_Popup()
                   */
            }
            
                
        }
}


//
//struct Room_Create_Enter_Previews: PreviewProvider {
//    @State private var a : Bool = false
//    static var previews: some View {
//        Room_Create_Enter()
//    }
//}
//
