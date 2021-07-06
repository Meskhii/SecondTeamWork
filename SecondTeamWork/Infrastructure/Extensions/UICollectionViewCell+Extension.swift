//
//  UICollectionViewCell+Extension.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
}
