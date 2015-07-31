//
//  FileUtil.swift
//  SwiftUtil
//
//  Created by chaluemwut noyunsan on 6/7/2558 BE.
//  Copyright (c) 2558 chaluemwut noyunsan. All rights reserved.
//

import Foundation

public class FileUtil {
    
    public static func writeFile(msg:String, fileName:String){
        if let dirs:[String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0]
            let path = dir.stringByAppendingPathComponent(fileName)
            msg.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding, error: nil);
        }
    }
    
    public static func readFile(fileName:String) -> String? {
        if let dirs:[String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0]
            let path = dir.stringByAppendingPathComponent(fileName)
            let ret:String? = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
            return ret
        }
        return nil
    }
}
