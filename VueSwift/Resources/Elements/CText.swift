//
//  CText.swift
//  VueSwift
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

open class CText: UITextView ,UITextViewDelegate{

    
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
    
    //v-input
    private var vue:Vue?
    public func v_input(vue:Vue){
        
        self.vue = vue
        self.delegate = self

    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        self.vue?.v_text(v: { () -> String? in
            return self.text
        })
        
        block?(textView.text)

        self.vue?.v_input?()

    }
    
    
    //v-change
    public typealias changeBlock = (_ text:String) ->()
    private var block:changeBlock?
    public func v_change(vue:@escaping changeBlock){
        
        block = vue
        self.delegate = self
        
    }
    
   

}
