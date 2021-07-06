//
//  File.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Variables
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    // MARK: - Initialisation
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
        
    }
    
    func start() {
       // let vc = GalleryViewController.instantiateFromStoryboard()
        let vc = AlbumsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(vc, animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func proceedToGalleryDetailVC(imageName: String, image: UIImage, coordinator: CoordinatorProtocol) {
        let vc = GalleryDetailViewController.instantiateFromStoryboard()
        vc.imageName = imageName
        vc.image = image
        vc.coordinator = coordinator
        navigationController?.pushViewController(vc, animated: true)
    }

    func proceedToImageEditVC(image: UIImage) {
        
    }
    
}
