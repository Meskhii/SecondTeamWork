//
//  FileManager.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//


import UIKit

enum FileErrors: Error {
    case cantSave
    case cantFetch
    case unknownError
}

class ImagesFileManager {
    
    static let shared = ImagesFileManager()
    
    private let manager = FileManager.default
    
    private var documentsDirectoryURL: URL? {
        try? manager.url(for: .applicationSupportDirectory,
                         in: .allDomainsMask,
                         appropriateFor: nil,
                         create: false)
    }
    
    private init() {
        createAlbumDirectory()
        createGalleryDirectory()
        createFavouriteImagesDirectory()
        print(documentsDirectoryURL!)
    }
    
    private func createAlbumDirectory() {
        guard let directory = documentsDirectoryURL else {return}
        let newDirectoryName = directory.appendingPathComponent("Album")
       
        do {
            try manager.createDirectory(at: newDirectoryName,
                                        withIntermediateDirectories: true,
                                        attributes: [:])
        } catch {
            print(error)
        }
    }
    
    private func createGalleryDirectory() {
        guard let directory = documentsDirectoryURL else {return}
        let albumDirectory = directory.appendingPathComponent("Album")
        let newGalleryDirectory = albumDirectory.appendingPathComponent("Gallery")
       
        do {
            try manager.createDirectory(at: newGalleryDirectory,
                                        withIntermediateDirectories: true,
                                        attributes: [:])
        } catch {
            print(error)
        }
    }
    
    private func createFavouriteImagesDirectory() {
        guard let directory = documentsDirectoryURL else {return}
        let albumDirectory = directory.appendingPathComponent("Album")
        let newGalleryDirectory = albumDirectory.appendingPathComponent("Favourite Images")
       
        do {
            try manager.createDirectory(at: newGalleryDirectory,
                                        withIntermediateDirectories: true,
                                        attributes: [:])
        } catch {
            print(error)
        }
    }
    
    
    // MARK: - Image Save Logic
    func saveImageInGallery(imgName: String, image: UIImage) throws {
        
        guard let directory = documentsDirectoryURL else {throw FileErrors.cantSave}
        
        let dirName = directory.appendingPathComponent("Album")
        let galleryDir = dirName.appendingPathComponent("Gallery")
        let noteUrl = galleryDir.appendingPathComponent("\(imgName).jpeg")
        
        guard let jpegData = image.jpeg else {throw FileErrors.cantSave}
        
        manager.createFile(atPath: noteUrl.path,
                            contents: jpegData,
                            attributes: [:])
    }
    
    func saveImageInFavouriteImages(imgName: String, image: UIImage) throws {
        
        guard let directory = documentsDirectoryURL else {throw FileErrors.cantSave}
        
        let dirName = directory.appendingPathComponent("Album")
        let galleryDir = dirName.appendingPathComponent("Favourite Images")
        let noteUrl = galleryDir.appendingPathComponent("\(imgName).jpeg")
        
        guard let jpegData = image.jpeg else {throw FileErrors.cantSave}
        
        manager.createFile(atPath: noteUrl.path,
                            contents: jpegData,
                            attributes: [:])
    }
    
    // MARK: - Image Fetching Logic
    func fetchImagesFromGallery() throws -> [UIImage] {
        guard let directory = documentsDirectoryURL else {throw FileErrors.cantFetch}
        let albumDir = directory.appendingPathComponent("Album")
        let imagesDir = albumDir.appendingPathComponent("Gallery")
        var images = [UIImage]()
        
        let fetchedFiles = try FileManager.default.contentsOfDirectory(at: imagesDir, includingPropertiesForKeys: nil, options: [])
        
        for image in fetchedFiles {
            do {
                let data = try Data(contentsOf: image)
                guard let img = data.uiImage else {continue}
                images.append(img)
            } catch {
                throw FileErrors.unknownError
            }
        }
                
        return images
    }
    
    func fetchImagesFromFavouriteImages() throws -> [UIImage] {
        guard let directory = documentsDirectoryURL else {throw FileErrors.cantFetch}
        let albumDir = directory.appendingPathComponent("Album")
        let imagesDir = albumDir.appendingPathComponent("Favourite Images")
        var images = [UIImage]()
        
        let fetchedFiles = try FileManager.default.contentsOfDirectory(at: imagesDir, includingPropertiesForKeys: nil, options: [])
        
        for image in fetchedFiles {
            do {
                let data = try Data(contentsOf: image)
                guard let img = data.uiImage else {continue}
                images.append(img)
            } catch {
                throw FileErrors.unknownError
            }
        }
                
        return images
    }
    
    // MARK: - Album Fetching Logic
    func fetchAlbums() throws -> [String] {
        guard let directory = documentsDirectoryURL else {throw FileErrors.cantFetch}
        let albumDir = directory.appendingPathComponent("Album")
        var albums = [String]()
        
        let fetchedAlbums = try FileManager.default.contentsOfDirectory(at: albumDir, includingPropertiesForKeys: nil, options: [])
        
        for album in fetchedAlbums {
            let alb = album.lastPathComponent
            if alb != ".DS_Store" {
                albums.append(alb)
            }
        }
        return albums
    }
    
    
}

