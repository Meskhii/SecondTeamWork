//
//  CameraViewModel.swift
//  SecondTeamWork
//
//  Created by Ilia Tsikelashvili on 07.07.21.
//

import Foundation
import UIKit

protocol CameraViewModelProtocol: AnyObject {
    func fetchGalleryImages() throws -> [UIImage]
    var controller: CoordinatorDelegate { get }
    init(controller: CoordinatorDelegate)
}

final class CameraViewModel : CameraViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func fetchGalleryImages() throws -> [UIImage] {
        var images = GalleryModel().images
        do {
            images = try ImagesFileManager.shared.fetchImagesFromGallery()
        } catch {
            throw FileErrors.cantFetchImages
        }
        return images
    }

}
