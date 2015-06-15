//
//  ImageUtil.swift
//  SwiftUtil
//
//  Created by chaluemwut noyunsan on 6/15/2558 BE.
//  Copyright (c) 2558 chaluemwut noyunsan. All rights reserved.
//

import UIKit

public class ImageUtil: NSObject {
 
    
    public static func imageResize(imageObj:UIImage, sizeChange:CGSize)-> UIImage{
        let hasAlpha = false
        let scale: CGFloat = 0.0
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        imageObj.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    
    public static func imageResize(imageObj:UIImage, reduceSize:CGFloat)-> UIImage{
        let hasAlpha = false
        let scale: CGFloat = 0.0
        let newHeight:CGFloat = imageObj.size.height/reduceSize
        let newWeigth:CGFloat = imageObj.size.width/reduceSize
        let sizeChange:CGSize = CGSizeMake(newWeigth, newHeight)
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        imageObj.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
 
}
