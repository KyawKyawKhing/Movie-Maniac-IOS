//
//  NetworkManager.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 9/28/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation

class NetworkManager {
    
    let defaultSession = URLSession.shared
    
    var dataTask: URLSessionDataTask?
    
    func loadData(route:String,success: @escaping (Any) -> Void,
                             failure: @escaping (Error) -> Void) {
        if var urlComponent = URLComponents(string: SharedConstants.BASE_URL + route) {
            urlComponent.query = "\(SharedConstants.QueryString.API_TOKEN)=\(SharedConstants.API_KEY)&\(SharedConstants.QueryString.PAGE)=\(1)"
            guard let url = urlComponent.url else { return }
            dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error {
                    print(error)
                    failure(error)
                    return
                }
                guard let data = data else { return }
                success(data)
//                do {
//                    let movie = try JSONDecoder().decode(BaseResponse.self, from: data)
//                    success(movie.results)
//                } catch let jsonErr {
//                    print("JSONSerialization error ==> \(jsonErr.localizedDescription)")
//                }
            })
            dataTask?.resume()
        }
    }
    
    func loadGenre(route:String,success: @escaping ([Genre]) -> Void,
                   failure: @escaping (Error) -> Void) {
        if var urlComponent = URLComponents(string: SharedConstants.BASE_URL + route) {
            urlComponent.query = "\(SharedConstants.QueryString.API_TOKEN)=\(SharedConstants.API_KEY)&\(SharedConstants.QueryString.PAGE)=\(1)"
            guard let url = urlComponent.url else { return }
            dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error {
                    print(error)
                    failure(error)
                    return
                }
                guard let data = data else { return }
                do {
                    let movie = try JSONDecoder().decode(BaseResponse.self, from: data)
//                    success(movie.results)
                } catch let jsonErr {
                    print("JSONSerialization error ==> \(jsonErr.localizedDescription)")
                }
            })
            dataTask?.resume()
        }
    }
}
