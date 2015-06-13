//
//  RandomUtil.swift
//  SwiftUtil
//
//  Created by chaluemwut noyunsan on 6/13/2558 BE.
//  Copyright (c) 2558 chaluemwut noyunsan. All rights reserved.
//

import UIKit

public class RandomUtil {
   
    public static func randomStringWithLength (len : Int) -> NSString {        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString : NSMutableString = NSMutableString(capacity: len)
        for (var i=0; i < len; i++){
            var length = UInt32 (letters.length)
            var rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        return randomString
    }
    
}
