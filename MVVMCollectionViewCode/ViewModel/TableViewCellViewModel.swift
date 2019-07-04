//
//  TableViewCellViewModel.swift
//  MVVM-2
//
//  Created by Ivan Akulov on 12/05/2018.
//  Copyright © 2018 Ivan Akulov. All rights reserved.
//

import UIKit

class CollectionViewCellViewModel: CollectionViewCellViewModelProtocol {
    internal var moduleImage: UIImage

    init(image: UIImage) {
        self.moduleImage = image
    }
}
