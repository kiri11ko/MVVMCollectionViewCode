//
//  NetworkServices.swift
//
//  Created by Кирилл Лукьянов on 04/07/2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import Foundation

class NetworkServices {

     func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
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

}
