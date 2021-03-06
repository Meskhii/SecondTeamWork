//
//  TabBarController.swift
//  SecondTeamWork
//
//  Created by Nana Jimsheleishvili on 06.07.21.
//

import UIKit

class TabBarController: UITabBarController, Storyboarded, CoordinatorDelegate {
    
    var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = self.viewControllers![0] as! GalleryViewController
        vc1.coordinator = coordinator
        
        let vc2 = self.viewControllers![1] as! FavouritesViewController
        vc2.coordinator = coordinator
        
        let vc3 = self.viewControllers![2] as! AlbumsViewController
        vc3.coordinator = coordinator
        
        let vc4 = self.viewControllers![3] as! CameraViewController
        vc4.coordinator = coordinator
    }

}
