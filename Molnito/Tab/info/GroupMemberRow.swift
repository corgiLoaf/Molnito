//
//  GroupMemberRow.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import SwiftUI

struct GroupMemberRow: View {
    var groupMember : GroupMember
    
    var body: some View {
        HStack(alignment: .center) {
            HStack{
                Text(groupMember.name)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                
            }
            .padding()

        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color("grayWhite"))
        .modifier(CardModifier()).frame(height: 60)
        .padding(.all, 10)
    }
}

struct GroupMemberRow_Previews: PreviewProvider {
    static var groupMembers = GroupModelData().groupMembers
    
    static var previews: some View {
        Group {
            GroupMemberRow(groupMember: groupMembers[0])
            GroupMemberRow(groupMember: groupMembers[1])
            
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
