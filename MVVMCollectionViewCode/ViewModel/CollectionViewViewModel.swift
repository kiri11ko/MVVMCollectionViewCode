//  Created Кирилл Лукьянов on 03/07/2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//
//  Template generated by Fauzi Sholichin @fauzisho
//  Component: ViewModel -

import Foundation

class CollectionViewViewModel: CollectionViewViewModelProtocol {

    init() {
        self.getJSON()
    }
    fileprivate let service =  NetworkServices()
    var isError = Observer<String>(value: "")
    var isLoading = Observer<Bool>(value: false)
    var imageList = Observer<[NSObject]>(value: [])

    func numberOfRows() -> Int {
        return imageList.value.count
    }
    func cellViewModel(forIndex indexPath: IndexPath) -> CollectionViewCellViewModelProtocol? {
        let image = imageList.value[indexPath.row]
        return CollectionViewCellViewModel(image: image)
    }

    func getJSON() {
        guard let url = URL(string: "http://api.giphy.com/v1/gifs/search?q=usa&api_key=LWsGBFf74m2HA28HFcG33Dhj1WmHYO2o") else { return}
        self.isLoading.value = true
        service.getData(from: url) { data, response, error in
            if let  error = error {
                self.isError.value = error.localizedDescription
                return
            }
            let responseData: JsonBase? = self.service.decodeJSON(type: JsonBase.self, from: data)
            guard let response = responseData?.jDataList else { return }
            DispatchQueue.main.async { [weak self] in
                self!.isLoading.value = false
            }
            for value in response {
                DispatchQueue.global().async {
                    if let url = URL(string: (value.images?.original?.url) ?? "" ) {
                        self.getImage(url: url)
                    }
                }
            }

        }
    }
    fileprivate func getImage(url: URL) {
        service.getData(from: url) { data, _, error in
            guard let data = data, error == nil else { return }
            self.imageList.value.append(data as NSObject)
        }
    }

}
