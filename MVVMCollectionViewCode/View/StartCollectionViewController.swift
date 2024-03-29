//  Created Кирилл Лукьянов on 03/07/2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//
//  Template generated by Fauzi Sholichin @fauzisho
//  Component: View -

import UIKit

class StartCollectionViewController: UIViewController {

    fileprivate var viewModel: CollectionViewViewModelProtocol?
    fileprivate var alert: UIAlertController!

    fileprivate lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)

        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        viewModel = CollectionViewViewModel()
        viewModel?.isError.addObserver({[weak self] (error) in
            if error != "" {
                self!.showErrorAlert(error)
            }
        })

        viewModel?.isLoading.addObserver({ [weak self]  (loading) in
                if loading {
                    self!.showAlert()
                } else {
                    self!.dissmisAlert()
                }
        })

        viewModel?.imageList.addObserver({ (_) in
            DispatchQueue.main.async { [weak self] in
                self!.collectionView.reloadData()
            }
        })

    }

    fileprivate func showAlert() {
        alert = UIAlertController(title: "", message: "Downloads json", preferredStyle: .alert)
        UIApplication.shared.keyWindow?.rootViewController?.present(self.alert, animated: true, completion: nil)
    }

    fileprivate func dissmisAlert() {
        alert.dismiss(animated: true, completion: nil)
    }

    fileprivate func showErrorAlert(_ error: String) {
        DispatchQueue.main.async { [weak self] in
            self!.alert.title = "Error"
            self!.alert.message = error
            let action = UIAlertAction(title: "ok", style: .default, handler: {[weak self] (_) in
                self!.viewModel?.getJSON()
            })
            self?.alert.addAction(action)
        }
    }

    deinit {
        viewModel?.isError.removeObserver()
        viewModel?.isLoading.removeObserver()
        viewModel?.imageList.removeObserver()

    }
}

extension StartCollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageCollectionViewCell
        cell?.viewModel = viewModel?.cellViewModel(forIndex: indexPath)

        return cell ?? UICollectionViewCell()
    }
}

extension StartCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

}
