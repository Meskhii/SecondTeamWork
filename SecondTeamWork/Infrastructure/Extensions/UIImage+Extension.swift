//
//  UIImage+Extension.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

extension UIImage {
    var jpeg: Data? { jpegData(compressionQuality: 1) }
    var png: Data? { pngData() }
}

