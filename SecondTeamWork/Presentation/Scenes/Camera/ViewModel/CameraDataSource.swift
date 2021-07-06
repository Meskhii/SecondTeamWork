//
//  CameraDataSource.swift
//  SecondTeamWork
//
//  Created by Ilia Tsikelashvili on 07.07.21.
//

import Foundation
import UIKit

class CameraDataSource : NSObject {
    
    private var viewModel: CameraViewModelProtocol!
//    private var albums = [String]()
    private var images = [UIImage]()
    private var imageManager : ImagesFileManager!
    private var imageView = UIImage()
    
    
    init(with viewModel: CameraViewModelProtocol, imageView : UIImage) {
        super.init()
        self.viewModel   = viewModel
        self.imageView   = imageView
    }
 
    func refresh() {
        do {
            images = try viewModel.fetchGalleryImages()
        } catch {
            print("Error")
        }
    }
}

extension CameraDataSource : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let id = UUID.init().uuidString
        guard let img = imageManager else {return}
        do {
            try img.saveImageInGallery(imgName: "\(id)", image: imageView)
        }
        catch {
            
        }
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        imageView = image
    }
}
