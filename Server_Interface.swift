import SwiftUI

struct APITEST: View{
    var body: some View{
        VStack{
            hi()
        }
    }
}

func hi() async{
    guard let url = URL(string: "http://localhost/") else {
        return    // 데이터를 보낼 서버 url
    }
                    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"         // http 메서드는 'POST'
            
    do { // request body에 전송할 데이터 넣기
        request.httpBody = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
    } catch {
        print(error.localizedDescription)
    }
            
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept-Type")
    
    let session = URLSession.shared
    session.dataTask(with: request, completionHandler: { (data, response, error) in
        print("전송완료")
    }).resume()
    
}
