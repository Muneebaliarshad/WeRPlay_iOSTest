//
//  DetailViewController.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 06/02/2022.
//

import UIKit

final class DetailViewController: BaseViewController, UIScrollViewDelegate {
    
    //MARK: - UIElements
    var scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.minimumZoomScale = 1
        sv.maximumZoomScale = 10
        sv.alwaysBounceVertical = false
        sv.alwaysBounceHorizontal = false
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        return sv
    }()
    let dataImageView = ImageView(imageName: "Logo")
    
    
    
    //MARK: - Variables
    var detailVM = DetailViewModel()
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = detailVM.selectedBreedName.capitalized
        dataImageView.setImageWith(stringURL: detailVM.selectedImage)
        scrollView.delegate = self
    }
    
    
    //MARK: - Setup Methods
    override func setViewUI() {
        addElementsToView()
    }
    
    fileprivate func addElementsToView() {
        view.addSubview(scrollView)
        scrollView.addSubview(dataImageView)
        
        NSLayoutConstraint.activate([
            
            ///scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            ///dataImageView
            dataImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            dataImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            dataImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            dataImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            dataImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            dataImageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    
    //MARK: - UIScrollViewDelegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return dataImageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = dataImageView.image {
                let heightRatio = dataImageView.frame.height / image.size.height
                let widthRatio = dataImageView.frame.width / image.size.width
                let ratio = widthRatio < heightRatio ? widthRatio : heightRatio
                
                let newHeight = image.size.height * ratio
                let newWidth = image.size.width * ratio
                
                let leftCondition = newWidth * scrollView.zoomScale > dataImageView.frame.width
                let left = 0.5 * (leftCondition ? (newWidth - dataImageView.frame.width) : (scrollView.frame.width - scrollView.contentSize.width))
                
                let topCondition = newHeight * scrollView.zoomScale > dataImageView.frame.height
                let top = 0.5 * (topCondition ? (newHeight - dataImageView.frame.height) : (scrollView.frame.height - scrollView.contentSize.height))
                
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        }
    }
}
