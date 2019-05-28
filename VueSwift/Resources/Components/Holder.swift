//
//  Handler.swift
//  CatFlow
//
//  Created by apple on 2019/4/23.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class Holder: NSObject {
    
    var v_selectVue = Vue()
    var model:Cat?
    func setModel(_ amodel:Cat){ self.model = amodel}

}
