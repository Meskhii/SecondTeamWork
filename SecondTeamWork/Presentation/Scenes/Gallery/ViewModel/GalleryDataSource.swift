//
//  GalleryDataSource.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//


import UIKit

class GalleryDataSource: NSObject {
    
    // MARK: - Variables
    private var collectionView: UICollectionView!
    private var viewModel: GalleryViewModelProtocol!
    private var coordinator: CoordinatorProtocol!
    private var images = [UIImage]()
    
    // MARK: - Init
    init(with collectionView: UICollectionView, viewModel: GalleryViewModelProtocol, coordinator: CoordinatorProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.viewModel = viewModel
        self.coordinator = coordinator
    }
    
    func refresh() {
        do {
            images = try viewModel.fetchGalleryImages()
            collectionView.reloadData()
        } catch {
            print("Unknow Error, while loading images please try again.")
        }
    }

    
}

// MARK: - UICollectionView Data Source
extension GalleryDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(ImageCell.self, for: indexPath)
        cell.configure(with: images[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionView Delegate
extension GalleryDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      //  coordinator.navigateToDetails(with image: images[indexPath.row])
    }
}

// MARK: - UICollectionView Delegate Flow Layout
extension GalleryDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/3.0
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

