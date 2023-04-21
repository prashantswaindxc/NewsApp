//
//  NewsSetvices.swift
//  NewsApp
//
//  Created by Prashant Swain on 20/04/23.
//

import Foundation

//MARK: HTTPMethod
enum HTTPMethod:String{
    case POST
    case GET
}


class NewsServices:NSObject{
    let session = URLSession.shared
    
    //MARK: Get news api from webservices
    func getNewsListApi<T>(completionHandler: @escaping (T?,_ error:Error?)->()) where T:Codable{
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-03-21&sortBy=publishedAt&apiKey=5a61d37021624a2f88101e51befb4612") else{return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.GET.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: urlRequest){ (data, urlResponse, error) in
            if error != nil{
                print(error?.localizedDescription ?? "")
                completionHandler(nil,error)
            }
            if data == nil{
                print("Client Error")
            }
            guard let responce = urlResponse as? HTTPURLResponse else{
                print("server Error")
                return
                
            }
            guard let mime = responce.mimeType, mime == "application/json" else{
                print("mime Type Wrong!")
                return
            }
            
            do {
                let decorder = JSONDecoder()
                let result = try decorder.decode(T.self, from: data!)
                completionHandler(result,nil)
            }catch(let error){
                print("\(error.localizedDescription)")
            }
            
        }.resume()
    }
}
