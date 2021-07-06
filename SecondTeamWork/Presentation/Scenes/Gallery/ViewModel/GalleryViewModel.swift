//
//  GalleryViewModel.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

protocol GalleryViewModelProtocol: AnyObject {
    func fetchGalleryImages() throws -> GalleryModel
    
    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class GalleryViewModel: GalleryViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func fetchGalleryImages() throws -> GalleryModel {
        var images = GalleryModel()
        do {
            images = try ImagesFileManager.shared.fetchImagesFromGallery()
        } catch {
            throw FileErrors.cantFetch
        }
        return images
    }

}
