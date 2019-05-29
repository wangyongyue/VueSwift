//
//  Vue.swift
//  VueSwift
//
//  Created by apple on 2019/5/28.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
typealias VueBlock = () -> ()
class Vue: NSObject {
    var array = Array<VueBlock>()
    
    
    var v_text:String?
    func v_text(v:()->String?){
        
        v_text = v()
        sendVueMsg()
    }
    
    var v_image:UIImage?
    func v_image(v:()->UIImage?){
        
        v_image = v()
        sendVueMsg()
    }
    var v_blind:[String:Any]?
    func v_blind(v:()->[String:Any]?){
        
        v_blind = v()
        sendVueMsg()
    }
    
    var v_if:Bool?
    func v_if(v:()->Bool?){
        
        v_if = v()
        sendVueMsg()
    }
    
    
    
    var v_on:VueBlock?
    func v_on(vue:@escaping VueBlock){
        
        self.v_on = vue
        
    }
    
    var v_input:VueBlock?
    func v_input(vue:@escaping VueBlock){
        
        self.v_input = vue
        
    }
    
    
    typealias VueIndexBlock = (_ index:Int) -> ()
    var v_index:VueIndexBlock?
    func v_index(vue:@escaping VueIndexBlock){
        
        self.v_index = vue
        
    }
    
    
    var v_array:Array<VueData>?
    func v_array(_ isPage:Bool,v:()->Array<VueData>?){
        if isPage{
            if let arr = v(),let v_arr = v_array{
                
                v_array = v_arr + arr
            }else{
                v_array = v()
                
            }
            
        }else{
            
            v_array = v()
            
        }
        sendVueMsg()
    }
    
    
    
    func setupVue(_ callBack:@escaping VueBlock){
        
        array.append(callBack)
        
    }
    func sendVueMsg(){
        
        for value in array{
            
            value()
        }
    }
    
}
