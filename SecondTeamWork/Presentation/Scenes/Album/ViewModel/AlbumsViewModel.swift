//
//  AlbumViewModel.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

protocol AlbumsViewModelProtocol: AnyObject {
    func fetchAlbums() throws -> [String]
    func fetchImageFromGallery() throws -> UIImage
    func fetchImageFromFavourites() throws -> UIImage
}

final class AlbumsViewModel: AlbumsViewModelProtocol {
    
    
    func fetchAlbums() throws -> [String] {
        var albums = [String]()
        do {
            albums = try ImagesFileManager.shared.fetchAlbums()
        } catch {
            throw FileErrors.cantFetch
        }
        return albums
    }
    
    func fetchImageFromGallery() throws -> UIImage {
        var image = UIImage()
        do {
            image = try ImagesFileManager.shared.fetchImagesFromGallery().last ?? UIImage(named: "emptyAlbum")!
        }catch {
            throw FileErrors.cantFetch
        }
        return image
    }
    
    func fetchImageFromFavourites() throws -> UIImage {
        var image = UIImage()
        do {
            image = try ImagesFileManager.shared.fetchImagesFromFavouriteImages().last ?? UIImage(named: "emptyAlbum")!
        } catch {
            throw FileErrors.cantFetch
        }
        return image
    }
}
