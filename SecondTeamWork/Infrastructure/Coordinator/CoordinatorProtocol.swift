//
//  CoordinatorProtocol.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
        
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func popViewController()
    func proceedToGalleryDetailVC(imageName: String, image: UIImage, coordinator: CoordinatorProtocol)
    func proceedToImageEditVC(image: UIImage)
    func proceedToGalleryVC() 
}
