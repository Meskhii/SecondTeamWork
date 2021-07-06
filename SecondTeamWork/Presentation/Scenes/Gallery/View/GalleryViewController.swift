//
//  ViewController.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

class GalleryViewController: BaseViewController {
    
    // MARK: - Variables
    private var galleryViewModel: GalleryViewModelProtocol!
    private var galleryDataSource: GalleryDataSource!
    
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
        galleryDataSource.refresh()
    }
    
    // MARK: - View Model Configuration
    private func configureViewModel() {
        galleryViewModel = GalleryViewModel()
        galleryDataSource = GalleryDataSource(with: collectionView, viewModel: galleryViewModel, coordinator: coordinator!)
        
        galleryDataSource.refresh()
    }

}

