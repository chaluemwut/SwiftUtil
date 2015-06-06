//
//  TokenButton.swift
//  SwiftUtil
//
//  Created by chaluemwut noyunsan on 6/6/2558 BE.
//  Copyright (c) 2558 chaluemwut noyunsan. All rights reserved.
//

import UIKit

class TokenButton: UIButton {
    
    let checkedImage = UIImage(named: "start")
    let unCheckedImage = UIImage(named: "unstart")
    
    required init(coder aDecoder: NSCoder) {
//        cvstPosition = 0
        super.init(coder: aDecoder)
    }
    
    var isChecked:Bool = false{
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, forState: .Normal)
            } else {
                self.setImage(unCheckedImage, forState: .Normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: Selector("buttonClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        self.backgroundColor = UIColor.clearColor()
        self.isChecked = false
    }
    
    func buttonClicked(){
        if isChecked == true {
            isChecked = false
        } else {
            isChecked = true
        }
    }

}
