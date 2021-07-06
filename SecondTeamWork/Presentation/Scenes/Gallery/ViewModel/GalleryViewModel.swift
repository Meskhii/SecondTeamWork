//
//  GalleryViewModel.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

protocol GalleryViewModelProtocol: AnyObject {
    func fetchGalleryImages() throws -> [UIImage]
}

final class GalleryViewModel: GalleryViewModelProtocol {
    
    func fetchGalleryImages() throws -> [UIImage] {
        var images = [UIImage]()
        do {
            images = try ImagesFileManager.shared.fetchImagesFromGallery()
        } catch {
            throw FileErrors.cantFetch
        }
        return images
    }

}
