//
//  CView.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CView: UIView {

    
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
            
            if let v = vue.v_if{
                self.isHidden = v
            }
        }
        
    }
    
    
    
    
    
    
}
