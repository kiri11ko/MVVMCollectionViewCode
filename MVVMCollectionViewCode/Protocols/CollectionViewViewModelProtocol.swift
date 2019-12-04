//
//  CollectionViewViewModelProtocol.swift
//  MVVMCollectionViewCode
//
//  Created by Кирилл Лукьянов on 03/07/2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import Foundation

protocol CollectionViewViewModelProtocol: class {

    var isError: Observer<String> { get set}
    var isLoading: Observer<Bool> {get set}
    var imageList: Observer<[NSObject]> { get set}
    func numberOfRows() -> Int
    func getJSON()
    func cellViewModel(forIndex indexPath: IndexPath) -> CollectionViewCellViewModelProtocol?
}
