//
//  FavouritesViewModel.swift
//  SecondTeamWork
//
//  Created by AltaSoftware MacMINI on 7/7/21.
//


import UIKit

protocol FavouritesViewModelProtocol: AnyObject {
    func fetchImagesFromFavouriteImages() throws -> GalleryModel
    
    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class FavouritesViewModel: FavouritesViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func fetchImagesFromFavouriteImages() throws -> GalleryModel {
        var images = GalleryModel()
        do {
            images = try ImagesFileManager.shared.fetchImagesFromGallery()
        } catch {
            throw FileErrors.cantFetch
        }
        return images
    }

}

