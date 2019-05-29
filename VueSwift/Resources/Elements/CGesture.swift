//
//  CGesture.swift
//  CatFlow
//
//  Created by wangyongyue on 2019/5/26.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

public typealias TapBlock = () -> ()
public class CGesture: UITapGestureRecognizer {
    
    public var tap:TapBlock?
   
    public convenience init(_ block:@escaping TapBlock){
        self.init()
        tap = block
        self.addTarget(self, action: #selector(tapEvent))
    }
    
    public var eventVue:Vue?
    public convenience init(vue:Vue){
        self.init()
        eventVue = vue
        self.addTarget(self, action: #selector(tapEvent))
    }

    @objc func tapEvent(){
        tap?()
        eventVue?.v_on?()
        
    }
}
