//
//  CGesture.swift
//  VueSwift
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
    
    internal var eventVue:Vue?
    public func v_on(vue:Vue){
        
        eventVue = vue
        self.addTarget(self, action: #selector(tapEvent))
    }

    @objc func tapEvent(){
        tap?()
        eventVue?.v_on?()
        
    }
}
