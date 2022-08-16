//
//  Interface.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/18.
//
import Foundation
import SwiftyJSON
func requestPOST(urls : String, body : Data) -> JSON{
    
    guard let url = URL(string : "http://192.249.18.198:80\(urls)") else { return JSON() }
    var request = URLRequest(url: url)
    request.httpMethod = "POST";
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = body
    var jsonData : JSON = JSON()
    let sem = DispatchSemaphore(value: 0)
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
            sem.signal()
            return
        }
        guard let stringData : String = String(data: data, encoding: .utf8) else {
                print("Error: data to string failed.")
                sem.signal()
                return
            }
        print(stringData)
        jsonData = JSON.init(parseJSON:stringData)
        sem.signal()
        return
        
    }.resume()
    
    sem.wait()
    return jsonData
}


/*
func login(user_id:String, user_pwd:String)->JSON{
    
    var i = -1
    var hold : JSON = JSON({})
    
    AF.request("http://192.249.18.198/login",method: .post, parameters: ["user_id":user_id, "user_pwd":user_pwd])
        .responseJSON{ (response) in
            //sem.signal()
        print("111")
        hold = JSON(response.value)
        print(hold)
        print("222")
        i = 1
    }
    
    
    while i<0{
        i = i-1
        print(i)
    }
        
    return hold
    
}



func signup(name:String,user_id:String, user_pwd:String){
    Alamofire.request("http://192.249.18.198/signup",method: .post, parameters: ["name":name, "user_id":user_id, "user_pwd":user_pwd], encoding: JSONEncoding.default)
        .validate(statusCode: 200..<300)
        .responseJSON { (response) in
        if let result = response.result.value
        {
            print(result)
        }
    }
}

func makegroup(Name: String,MasterToken: String, MaxMember: Int, HowLong: Int, CurrentMember: Int, Token: Int){
    Alamofire.request("http://192.249.18.198/makegroup",method: .post, parameters: ["Name": Name,"MasterToken": MasterToken, "MaxMember": MaxMember, "HowLong": HowLong, "CurrentMember": CurrentMember, "Token": Token], encoding: JSONEncoding.default)
        .validate(statusCode: 200..<300)
        .responseJSON { (response) in
        if let result = response.result.value
        {
            print(result)
        }
    }
}

func entergroup(groupToken: Int, user_token: String){
    Alamofire.request("http://192.249.18.198/makegroup",method: .post, parameters: ["groupToken":groupToken, "user_token":user_token], encoding: JSONEncoding.default)
        .validate(statusCode: 200..<300)
        .responseJSON { (response) in
        if let result = response.result.value
        {
            print(result)
        }
    }
}


func startmatch(groupToken: Int, user_token: String, startDate:String, endDate:String){
    Alamofire.request("http://192.249.18.198/startmatch",method: .post, parameters: ["groupToken":groupToken, "user_token":user_token,"startDate":startDate,"endDate":endDate], encoding: JSONEncoding.default)
        .validate(statusCode: 200..<300)
        .responseJSON { (response) in
        if let result = response.result.value
        {
            print(result)
        }
    }
}

func deletegroup(groupToken: Int){
    Alamofire.request("http://192.249.18.198/deletegroup",method: .post, parameters: ["groupToken":groupToken], encoding: JSONEncoding.default)
        .validate(statusCode: 200..<300)
        .responseJSON { (response) in
        if let result = response.result.value
        {
            print(result)
        }
    }
}

func ingroup(groupToken: Int, userToken: String){
    Alamofire.request("http://192.249.18.198/ingroup",method: .post, parameters: ["groupToken":groupToken, userToken:userToken], encoding: JSONEncoding.default)
        .validate(statusCode: 200..<300)
        .responseJSON { (response) in
        if let result = response.result.value
        {
            print(result)
        }
    }
}

func listofgroup(userToken: String){
    Alamofire.request("http://192.249.18.198/listofgroup",method: .post, parameters: ["userToken":userToken], encoding: JSONEncoding.default)
        .validate(statusCode: 200..<300)
        .responseJSON { (response) in
        if let result = response.result.value
        {
            print(result)
        }
    }
}
*/
