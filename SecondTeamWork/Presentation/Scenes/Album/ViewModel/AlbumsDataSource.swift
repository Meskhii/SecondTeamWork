//
//  AlbumDataSource.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//


import UIKit

class AlbumsDataSource: NSObject {
    
    // MARK: - Variables
    private var collectionView: UICollectionView!
    private var viewModel: AlbumsViewModelProtocol!
    private var coordinator: CoordinatorProtocol!
    private var albums = [String]()
    
    // MARK: - Init
    init(with collectionView: UICollectionView, viewModel: AlbumsViewModelProtocol, coordinator: CoordinatorProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.viewModel = viewModel
        self.coordinator = coordinator
    }
    
    func refresh() {
        do {
            albums = try viewModel.fetchAlbums()
            collectionView.reloadData()
        } catch {
            print("Unknow Error, while loading images please try again.")
        }
    }

    
}

// MARK: - UICollectionView Data Source
extension AlbumsDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(ImageCell.self, for: indexPath)
        //cell.configure(with: album[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionView Delegate
extension AlbumsDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     // Navigation To Album
    }
}

// MARK: - UICollectionView Delegate Flow Layout
extension AlbumsDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/2.0
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


