//
//  showToken.swift
//  makeGroup
//
//  Created by 박강우 on 2022/07/18.
//

import SwiftUI

struct showToken: View {
    @ObservedObject var sgroupVM : GroupViewModel
    @State var isactive = false;
    var body: some View {
        
                VStack{
                    Spacer()
                    tokens(tgroupVM : sgroupVM)
                        .frame(width: 400, height: 500)
                        .cornerRadius(25)
                        .background()
                        .hoverEffect(.highlight)

                    NavigationLink(destination: ProfileView()
                                   ,isActive: $isactive, label:{
                        Button(action: {
                            sgroupVM.setEndDate(getDateWithCal(plus: sgroupVM.group.HowLong))
                            sgroupVM.setStartDate(getDate())
                            let encoder = JSONEncoder()
                            encoder.outputFormatting = .prettyPrinted
                            let da = try! encoder.encode(sgroupVM.group)
                            _ = requestPOST(urls: "/makeGroup",body: da)
                            //_ = requestPOST(urls: "/startMatch", body: da)
                            isactive = true
                        }, label: {
                        Text("방 생성완료")
                            .frame(width: 400,height: 40)
                            .foregroundColor(.white)
                        })
                    })
                    .background(Color("hanyangOrange"))
                    .cornerRadius(8)
                    
                }.background(
                    Image("madcamp_pattern"))
        }
    
    func getDate() -> String{
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name : "ko_KR") as TimeZone?
        return dateFormatter.string(from: now)
    }
    func getDateWithCal(plus : Int) -> String{
        let today = Date()
        let plusDate = Calendar.current.date(byAdding: Calendar.Component.day,value: plus, to: today as Date)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name : "ko_KR") as TimeZone?
        return dateFormatter.string(from: plusDate)
    }
}

//struct showToken_Previews: PreviewProvider {
//    static var previews: some View {
//        showToken()
//    }
//}

