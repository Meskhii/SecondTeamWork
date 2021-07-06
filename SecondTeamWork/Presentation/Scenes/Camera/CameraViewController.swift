//
//  CameraViewController.swift
//  SecondTeamWork
//
//  Created by Ilia Tsikelashvili on 06.07.21.
//

import UIKit

class CameraViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    private var imageManager : ImagesFileManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.backgroundColor = .clear
    }
   

    @IBAction func didTapButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true)
    }
}

extension CameraViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let id = UUID.init().uuidString
        guard let img = imageManager else {return}
        do {
            try img.saveImageInGallery(imgName: "\(id)", image: imgView.image!)
        }
        catch {
            
        }
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        imgView.image = image
    }
}



