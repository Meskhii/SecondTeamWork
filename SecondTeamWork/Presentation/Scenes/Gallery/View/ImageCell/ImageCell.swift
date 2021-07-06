//
//  ImageCell.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

class ImageCell: UICollectionViewCell {

    @IBOutlet weak var galleryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with image: UIImage) {
        galleryImageView.image = image
    }

}
