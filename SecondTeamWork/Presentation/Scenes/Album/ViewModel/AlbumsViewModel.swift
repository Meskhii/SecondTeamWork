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
        var gallery = GalleryModel()
        do {
            gallery = try ImagesFileManager.shared.fetchImagesFromGallery()
        }catch {
            throw FileErrors.cantFetch
        }
        return gallery.images.last ?? UIImage(named: "emptyAlbum")!
    }
    
    func fetchImageFromFavourites() throws -> UIImage {
        var favourites = GalleryModel()
        do {
            favourites = try ImagesFileManager.shared.fetchImagesFromFavouriteImages()
        } catch {
            throw FileErrors.cantFetch
        }
        return favourites.images.last ?? UIImage(named: "emptyAlbum")!
    }
}
