//
//  CImage.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CImageView: UIImageView {

    //v-image
    func v_image(vue:Vue){
        
        vue.setupVue {
            self.image = vue.v_image
        }
        
    }
    //v-bind
    func v_bind(vue:Vue){
        vue.setupVue {

            if let dic = vue.v_blind{
                self.setValuesForKeys(dic)
            }
        }
    }
    //v-if
    func v_if(vue:Vue){
        
        vue.setupVue {

            if let v = vue.v_if {
                self.isHidden = v
            }
        }
        
    }
}
