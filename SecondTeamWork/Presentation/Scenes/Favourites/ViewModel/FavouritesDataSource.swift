//
//  FavouritesDataSource.swift
//  SecondTeamWork
//
//  Created by AltaSoftware MacMINI on 7/7/21.
//



import UIKit

class FavouritesDataSource: NSObject {
    
    // MARK: - Variables
    private var collectionView: UICollectionView!
    private var viewModel: FavouritesViewModelProtocol!
    private var images = GalleryModel()
    
    // MARK: - Init
    init(with collectionView: UICollectionView, viewModel: FavouritesViewModelProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.viewModel = viewModel
    }
    
    func refresh() {
        do {
            images = try viewModel.fetchImagesFromFavouriteImages()
            collectionView.reloadData()
        } catch {
            print("Unknow Error, while loading images please try again.")
        }
    }
}

// MARK: - UICollectionView Data Source
extension FavouritesDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(ImageCell.self, for: indexPath)
        cell.configure(with: images.images[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionView Delegate
extension FavouritesDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.controller.coordinator?.proceedToGalleryDetailVC(imageName: images.imageNames[indexPath.row], image: images.images[indexPath.row], coordinator: viewModel.controller.coordinator!)
    }
}

// MARK: - UICollectionView Delegate Flow Layout
extension FavouritesDataSource: UICollectionViewDelegateFlowLayout {
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

