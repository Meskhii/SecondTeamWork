//
//  EditImageViewController.swift
//  SecondTeamWork
//
//  Created by AltaSoftware MacMINI on 7/6/21.
//

import UIKit

class EditImageViewController: BaseViewController {
    
    var newImage: UIImage!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            scrollView.minimumZoomScale = 1
            scrollView.maximumZoomScale = 2
        }
    }
    @IBOutlet weak var editImage: UIImageView!
    @IBOutlet weak var cropView: UIView! {
        didSet {
            cropView.layer.cornerRadius = 5
            cropView.layer.borderWidth = 3
            cropView.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    // MARK: - Actions
    @IBAction func cropImage(_ sender: Any) {
        scrollView.isUserInteractionEnabled = true
        guard let imageToCrop = editImage.image else {
            return
        }
        
        let cropRect = CGRect(x: cropView.frame.origin.x - editImage.realImageRect().origin.x,
                              y: cropView.frame.origin.y - editImage.realImageRect().origin.y,
                              width: cropView.frame.width,
                              height: cropView.frame.height)
        
        let croppedImage = ImageCropHandler.sharedInstance.cropImage(imageToCrop,
                                                                     toRect: cropRect,
                                                                     imageViewWidth: editImage.frame.width,
                                                                     imageViewHeight: editImage.frame.height)
        editImage.image = croppedImage
        scrollView.zoomScale = 1
    }
    
    @IBAction func rotateImage(_ sender: Any) {
        //        self.editImage.transform = self.editImage.transform.rotated(by: -CGFloat(M_PI_2))
        newImage = editImage.image!.rotate(radians: -.pi/2)
        editImage.image = newImage
    }
    
    @IBAction func saveImage(_ sender: Any) {
        let id = UUID.init().uuidString
        try? ImagesFileManager.shared.saveImageInGallery(imgName: id, image: newImage)
        coordinator?.proceedToGalleryVC()
    }
    
    
}

// MARK: - UIScrollViewDelegate
extension EditImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return editImage
    }
}


