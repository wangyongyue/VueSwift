//
//  Handler.swift
//  CatFlow
//
//  Created by apple on 2019/4/23.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

open class Holder: NSObject {
    
    public var v_selectVue = Vue()
    open var model:VueData?
    open func setModel(_ amodel:VueData){ self.model = amodel}

}
