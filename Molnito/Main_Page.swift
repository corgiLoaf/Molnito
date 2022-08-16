//
//  Main_Page.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/15.
//

import SwiftUI
import ExytePopupView
import SwiftyJSON


struct Main_Page: View {
    
    @State private var popup_enter : Bool = false
    @State private var code_enter : Bool = false
    
    @Binding var userToken : String
    
    var body: some View {
      
            ZStack{
                
                VStack{
                    Image_Main()
                    Spacer()
                }
                
                VStack{
                    VStack{
                        
                    }
                    .frame(width: 200, height: 100)  // for 배경 이미지
                    VStack(alignment: .center,spacing: 10){
                        
                        Room_Create_Enter(is_popup: $popup_enter, userToken: $userToken)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)
                        //Room_Create_Enter()
                        Group_List(userToken: $userToken)
                        
                    }
                }
            }
            .popup(isPresented: $popup_enter, type:.floater(verticalPadding: 230), closeOnTap: false
            ){
                Room_Enter_Popup(is_popup: $popup_enter)
            }
        
        
        
    }
}


/*
struct Main_Page_Previews: PreviewProvider {

    static var previews: some View {
        Main_Page()
    }
}
*/
