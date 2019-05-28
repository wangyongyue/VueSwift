//
//  CField.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CField: UITextField {

    //{{ msg }}
    func v_text(vue:Vue){
        
        vue.setupVue {
            self.text = vue.v_text
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
    //v-input
    private var vue:Vue?
    func v_input(vue:Vue){
        
        self.vue = vue
        self.addTarget(self, action: #selector(changeText), for: .editingChanged)
        
    }
    @objc func changeText(){
        
        self.vue?.v_text(v: { () -> String? in
            
            return self.text
        })
        
        self.vue?.v_input?()
    }
    
    //v-change
    var block:VueBlock?
    func v_change(vue:@escaping VueBlock){
        
        block = vue
        self.addTarget(self, action: #selector(changeNewText), for: .editingChanged)
        
    }
    @objc func changeNewText(){
        
        block?()
    }

}
