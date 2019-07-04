//
//  NetworkServices.swift
//  MVVMCollectionViewCode
//
//  Created by Кирилл Лукьянов on 04/07/2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import Foundation

class DataServices {
    
     func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
            do {
                let objects = try decoder.decode(type.self, from: data)
                return objects
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                return nil
            }
    }
    
//    func getJSON() {
//        guard let url = URL(string: "http://api.giphy.com/v1/gifs/search?q=usa&api_key=LWsGBFf74m2HA28HFcG33Dhj1WmHYO2o") else { return}
//
//        getData(from: url) { data, response, error in
//            if let  error = error {
////                self.isError.value = error.localizedDescription
//                return }
//            guard let data = data else { return }
//            let jsonDecoder = JSONDecoder()
//            guard let responseModel = try? jsonDecoder.decode(JsonBase.self, from: data) else { return }
//            guard let response = responseModel.data else { return }
//            DispatchQueue.main.async { [weak self] in
//                self!.isLoading.value = false
//            }
//            for value in response {
//                DispatchQueue.global().async {
//                    if let url = URL(string: (value.images?.original?.url) ?? "" ) {
//                        self.getImage(url: url)
//                    }
//                }
//
//            }
//
//        }
//    }
//
//    fileprivate func getImage(url: URL) {
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            guard let image = UIImage(data: data) else { return }
//            self.imageList.value.append(image)
//        }
//    }
}
