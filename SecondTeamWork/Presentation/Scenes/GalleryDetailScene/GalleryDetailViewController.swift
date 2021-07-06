//
//  GalleryDetailViewController.swift
//  SecondTeamWork
//
//  Created by Nana Jimsheleishvili on 06.07.21.
//

import UIKit

class GalleryDetailViewController: BaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favouriteIcon: UIButton!
    
    //MARK: - Variables
    var imageName: String!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIfImageIsFavourited()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewWillAppear(true)

        imageView.image = image
    }
    
    //MARK: - IBActions
    @IBAction func backButton(_ sender: Any) {
        coordinator?.popViewController()
    }
    @IBAction func editButton(_ sender: Any) {
        coordinator?.proceedToImageEditVC(image: image)
    }
    @IBAction func shareButton(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [self.imageView.image!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBAction func deleteButton(_ sender: Any) {
        ImagesFileManager.shared.deleteImageFromGallery(imageName: imageName)
        ImagesFileManager.shared.deleteImageFromFavourite(imageName: imageName)
        coordinator?.popViewController()
    }
    @IBAction func favouriteButton(_ sender: UIButton) {
        if sender.currentImage == UIImage(systemName: "heart") {
            do {
                try ImagesFileManager.shared.saveImageInFavouriteImages(imgName: imageName, image: imageView.asImage())
            } catch {
                
            }
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            ImagesFileManager.shared.deleteImageFromFavourite(imageName: imageName)
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    private func checkIfImageIsFavourited() {
        if ImagesFileManager.shared.checkIfImageIsFavourited(imageName: imageName){
            favouriteIcon.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favouriteIcon.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
}
