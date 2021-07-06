//
//  AlbumViewModel.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

protocol AlbumsViewModelProtocol: AnyObject {
    func fetchAlbums() throws -> [String]
}

final class AlbumsViewModel: AlbumsViewModelProtocol {
    
    func fetchAlbums() throws -> [String] {
        var albums = [String]()
        do {
            albums = try ImagesFileManager.shared.fetchAlbums()
        } catch {
            throw FileErrors.cantFetchImages
        }
        return albums
    }

}
