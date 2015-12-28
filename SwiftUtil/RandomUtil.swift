//
//  RandomUtil.swift
//  SwiftUtil
//
//  Created by chaluemwut noyunsan on 6/13/2558 BE.
//  Copyright (c) 2558 chaluemwut noyunsan. All rights reserved.
//

import UIKit

public class RandomUtil {
   
    public static func randomStringWithLength (len : Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString : NSMutableString = NSMutableString(capacity: len)
        for (var i=0; i < len; i++){
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        return String(randomString)
    }
    
}
