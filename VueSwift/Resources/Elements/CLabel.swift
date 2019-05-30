//
//  CLabel.swift
//  VueSwift
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

open class CLabel: UILabel {

    //{{ msg }}
    public func v_text(vue:Vue){
        
        vue.setupVue {
            self.text = vue.v_text
        }
        
    }
    //v-bind
    public func v_bind(vue:Vue){
        vue.setupVue {

            if let dic = vue.v_blind{
                self.setValuesForKeys(dic)
            }
        }
        
    }
    //v-if
    public func v_if(vue:Vue){
        
        vue.setupVue {
            
            if let v = vue.v_if{
                self.isHidden = v
            }
        }
        
    }

}
