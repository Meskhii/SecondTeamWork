//
//  CameraViewController.swift
//  SecondTeamWork
//
//  Created by Ilia Tsikelashvili on 06.07.21.
//

import UIKit

class CameraViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    private var cameraViewModel: CameraViewModelProtocol!
    private var cameraDataSource: CameraDataSource!
    
    private var imageManager : ImagesFileManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViewModel()

    }
   

    @IBAction func didTapButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true)
    }
    
    private func configureViewModel() {
        cameraViewModel = CameraViewModel(controller: self)
        cameraDataSource = CameraDataSource(with: cameraViewModel, imageView: imgView.image!)
        cameraDataSource.refresh()
    }
}




