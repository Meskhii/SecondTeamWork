//
//  FavouritesViewController.swift
//  SecondTeamWork
//
//  Created by AltaSoftware MacMINI on 7/7/21.
//

import UIKit

class FavouritesViewController: BaseViewController {
    // MARK: - Variables
    private var galleryViewModel: FavouritesViewModelProtocol!
    private var favouritesDataSource: FavouritesDataSource!
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.registerNib(class: ImageCell.self)
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        favouritesDataSource.refresh()
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - View Model Configuration
    private func configureViewModel() {
        galleryViewModel = FavouritesViewModel(controller: self)
        favouritesDataSource = FavouritesDataSource(with: collectionView, viewModel: galleryViewModel)
        
        favouritesDataSource.refresh()
    }

}
