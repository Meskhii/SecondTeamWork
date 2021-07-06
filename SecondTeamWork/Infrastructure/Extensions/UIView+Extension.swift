//
//  UIView+Extension.swift
//  SecondTeamWork
//
//  Created by user200328 on 7/6/21.
//

import UIKit

extension UIView {
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
}
