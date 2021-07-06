//
//  AlbumCell.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

class AlbumCell: UICollectionViewCell {

    @IBOutlet weak var albumLastImage: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with image: UIImage, and name: String) {
        albumLastImage.image = image
        albumNameLabel.text = name
    }

}
