//
//  UIUtil.swift
//  SwiftUtil
//
//  Created by chaluemwut noyunsan on 5/6/2559 BE.
//  Copyright © 2559 chaluemwut noyunsan. All rights reserved.
//

import Foundation

struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}


public class UIUtil {
    
    public static func standardButton(rec: CGRect, msg:String, color:UIColor) -> UIButton {
        let btn = UIButton(type: .Custom)
        btn.frame = rec
        btn.setTitle(msg, forState: .Normal)
        btn.setTitleColor(color, forState: .Normal)
        btn.layer.borderWidth = 0.5
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = color.CGColor
        return btn
    }
    
    public static func getSize(iphone: CGRect, iphone6plus: CGRect, ipad: CGRect) -> CGRect {
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad){
            return ipad
        } else if  UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0{
            return iphone6plus
        } else {
            // Iphone
            return iphone
        }
    }
    
}