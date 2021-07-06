//
//  AlbumViewController.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

class AlbumsViewController: BaseViewController {

    // MARK: Variables
    private var albumsViewModel: AlbumsViewModelProtocol!
    private var albumsDataSource: AlbumsDataSource!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.registerNib(class: ImageCell.self)
        
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        albumsDataSource.refresh()
    }
    
    // MARK: - View Model Configuration
    private func configureViewModel() {
        albumsViewModel = AlbumsViewModel()
        albumsDataSource = AlbumsDataSource(with: collectionView, viewModel: albumsViewModel, coordinator: coordinator!)
        
        albumsDataSource.refresh()
    }

}
