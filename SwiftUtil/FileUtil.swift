//
//  FileUtil.swift
//  SwiftUtil
//
//  Created by chaluemwut noyunsan on 6/7/2558 BE.
//  Copyright (c) 2558 chaluemwut noyunsan. All rights reserved.
//

import Foundation

public class FileUtil {
    
    public static func removeFileName(fileName:String) {
        if let dirs:[String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0] as NSString
            let path = dir.stringByAppendingPathComponent(fileName)
            do {
                try NSFileManager.defaultManager().removeItemAtPath(path)
            } catch _ {
                
            }
        }
    }
    
    public static func writeFile(msg:String, fileName:String){
        if let dirs:[String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0] as NSString
            let path = dir.stringByAppendingPathComponent(fileName)
            do {
                try msg.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding);
            } catch _ {
                
            }
        }
    }
    
    public static func readFile(fileName:String) -> String? {
        if let dirs:[String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0] as NSString
            let path = dir.stringByAppendingPathComponent(fileName)
            do {
                let ret:String? = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                return ret
            } catch _ {
                return nil
            }
        }
        return nil
    }
    
    public static func writeImage(img:UIImage, fileName:String){
        if let dirs:[String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0] as NSString
            let path = dir.stringByAppendingPathComponent(fileName)
            UIImageJPEGRepresentation(img, 1.0)!.writeToFile(path, atomically: true)
        }
    }
    
    public static func readImag(fileName:String) -> UIImage? {
        if let dirs:[String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0] as NSString
            let path = dir.stringByAppendingPathComponent(fileName)
            let ret:UIImage? = UIImage(contentsOfFile: path)
            return ret
        }
        return nil
    }
}
