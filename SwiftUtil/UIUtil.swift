//
//  UIUtil.swift
//  SwiftUtil
//
//  Created by chaluemwut noyunsan on 5/6/2559 BE.
//  Copyright © 2559 chaluemwut noyunsan. All rights reserved.
//

import Foundation

public class UIUtil {
    
    public static func standardButton(rec: CGRect, msg:String, color:UIColor) -> UIButton {
        var btn = UIButton(type: .Custom)
        btn.frame = rec
        btn.setTitle(msg, forState: .Normal)
        btn.setTitleColor(color, forState: .Normal)
        btn.layer.borderWidth = 0.5
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = color.CGColor
        return btn
    }
    
}