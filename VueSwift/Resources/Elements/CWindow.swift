//
//  CWindow.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CWindow: UIView {

    var disappear = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let window = UIApplication.shared.keyWindow
        if let w = window{
            
            self.backgroundColor = UIColor.clear
            self.frame = w.bounds
            w.addSubview(self)
        }
    }
    convenience init(_ disappear:Bool,_ backColor:UIColor = UIColor.clear){
        self.init()
        self.disappear = disappear
        self.backgroundColor = backColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.disappear{
            self.removeFromSuperview()
            
        }
    }
    
}
