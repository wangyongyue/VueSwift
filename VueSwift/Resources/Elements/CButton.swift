//
//  CButton.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CButton: UIButton {

    //{{ msg }}
    func v_text(vue:Vue){
        
        vue.setupVue {
            self.setTitle(vue.v_text, for: .normal)
        }
        
    }
    //v-image
    func v_image(vue:Vue){
        
        vue.setupVue {
            self.setImage(vue.v_image, for: .normal)
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
            
            if let v = vue.v_if{
                self.isHidden = v
            }
        }
        
    }
    //v-on
    var vue:Vue?
    func v_on(vue:Vue){
        
        self.addTarget(self, action: #selector(clickEvent), for: .touchUpInside)
        self.vue = vue
        
    }
    @objc func clickEvent(){
        
        self.vue?.v_on?()

    }

    //v-click
    var block:VueBlock?
    func v_click(vue:@escaping VueBlock){
        
        self.addTarget(self, action: #selector(clickNewEvent), for: .touchUpInside)
        block = vue
        
    }
    @objc func clickNewEvent(){
        
        block?()
    }

}
