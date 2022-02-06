//
//  ListViewController.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 06/02/2022.
//

import UIKit


class ListViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - UIElements
    var collectionView : CollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        
        let cv = CollectionView(layout: layout)
        cv.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.identifier)
        return cv
    }()
    
    //MARK: - Variables
    var listVM = ListViewModel()
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = listVM.selectedBreedName.capitalized
        collectionView.setEmptyView(title: "Please_Wait", message: "Data_Is_Loading", messageImage: UIImage(named: "Loading")!)
        listVM.getBreedImages()
    }
    
    
    //MARK: - Setup Methods
    override func setViewUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        addElementsToView()
    }
    
    fileprivate func addElementsToView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            ///homeTableView
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    override func bindViews() {
        listVM.errorMessage.bind { message in
            self.showAlert(title: "alert", message: message)
        }
        
        listVM.breedListSuccues.bind { _ in
            if self.listVM.breedImagesData?.count == 0 {
                self.collectionView.setEmptyView(title: "No_Result_Found", message: "Try_Again", messageImage: UIImage(named: "NoData")!)
                
            } else {
                self.collectionView.restore()
                self.collectionView.reloadData()
            }
        }
    }
    
    //MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listVM.breedImagesData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier, for: indexPath) as! ListCollectionViewCell
        cell.dataImageView.setImageWith(stringURL: listVM.breedImagesData?[indexPath.row] ?? "")
        return cell
    }
    
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.detailVM = DetailViewModel(selectedBreedName: listVM.selectedBreedName, selectedImage: listVM.breedImagesData?[indexPath.row] ?? "")
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 5, height: (collectionView.frame.width / 2) - 5)
    }
}
