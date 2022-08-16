//
//  ContentView.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/14.
//

import SwiftUI

struct ContentView: View {
    @State var usertoken = "123"
    var body: some View {
        LoginView()
        //Main_Page(userToken:$usertoken)
    } // body
} // View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
