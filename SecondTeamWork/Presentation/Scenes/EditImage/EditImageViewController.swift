//
//  EditImageViewController.swift
//  SecondTeamWork
//
//  Created by AltaSoftware MacMINI on 7/6/21.
//

import UIKit

class EditImageViewController: BaseViewController {

    @IBOutlet weak var editImage: UIImageView!

  

   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func rotateImage(_ sender: Any) {
        self.editImage.transform = self.editImage.transform.rotated(by: -CGFloat(M_PI_2))

    }
    
    @IBAction func cropImage(_ sender: Any) {
    }
    
    @IBAction func saveEdit(_ sender: Any) {
  
    }


    

}
