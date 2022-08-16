//
//  Group_List.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/14.
//

//
//  Group_List.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/14.
//

import SwiftUI

struct Group_List: View {
    
    @Binding var userToken : String
    /*
    var hold = listOfGroup(userToken:userToken)
    */
    var hold = ["1","2","3","4"]
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("가입한 그룹")
                .fontWeight(.bold)
                .padding([.top, .leading], 15)
            List {
                ForEach(hold, id:\.self){num in
                    NavigationLink(destination: BaseView()){
                        Text("Group #1")
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                    //Button {
                        //Group_detail()
                    //} label: {
                        //Text("Group #1")
                    //}
                }
            }.listStyle(PlainListStyle())
        
        }
        
    }
}
        

/*
struct Group_List_Previews: PreviewProvider {
    static var previews: some View {
        Group_List(userToken: "")
    }
}

*/
