//
//  UIImageView+ET.swift
//  ETUtilities
//
//  Created by Jan Čislinský on 09/02/2017.
//
//

import Foundation

public extension UIImageView {

    /// Initalizes image view with image of given name. If image with given name
    /// isn't valid, returns image view without image.
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 02/2017
    convenience init(imageName: String) {
        self.init()
        self.image = UIImage(named: imageName)
    }

    /// Return size of image that is <= that frame size. If image size is lower
    /// than frame size, returns it without change. Otherwise returns decreased
    /// size that fills maximum of frame size (but no more). 
    ///
    /// - Note: Resulting size is rounded down (floor).
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 02/2017
    var et_imageSizeRespectingFrame: CGSize {

        guard let i = image else { return .zero }

        let iSize = i.size
        let fSize = frame.size

        if iSize.width < fSize.width && iSize.height < fSize.height {
            return iSize
        }
        else {
            let widthRatio = iSize.width / fSize.width
            let heightRatio = iSize.height / fSize.height

            let maxRatio = max(widthRatio, heightRatio)

            return CGSize(width: floor(iSize.width / maxRatio), height: floor(iSize.height / maxRatio))
        }
    }
}
