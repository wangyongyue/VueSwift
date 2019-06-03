//
//  Main.swift
//  VueSwift
//
//  Created by apple on 2019/5/30.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class Main:MainProtocol{
    
    var arrayVue: Vue = Vue()
    var indexVue: Vue = Vue()
    
    func startListen() {
        
        
        loadData()
        
        indexVue.v_index { (index) in
         
            
            let m = self.arrayVue.v_array?[index] as! MainModel
            print(m.data?.name)
            print(m.v_identifier)
            if m.v_identifier == 0{
                
                Router.push(Details().getViewController(), ["id":"10"], nil)
                
            }
            
        }
        
    }
    
    func getViewController() -> UIViewController {
        
        let vc = MainVC()
        vc.m = self
        vc.navigationItem.title = "列表"
        return vc
        
    }
    
    func loadData(){
        
        var array = Array<VueData>()
        for i in 1...12{
            
            let m = MainModel()
            let d = MainData()
            d.name = "数据"
            m.data = d
            array.append(m)
            
        }
        
        
        arrayVue.v_array(true, v: { () -> Array<VueData>? in
            
            return array
        })
        
        
        
    }
    
    
}
class MainModel: VueData,MainCellProtocol{
    
    
    var v_palm: String = "MainCell"
    var v_identifier:Int = 0
    var v_selectVue:Vue = Vue()
    
    
    var textVue:Vue = Vue()
    var clickVue:Vue = Vue()
    var inputVue:Vue = Vue()
    var tapVue:Vue = Vue()
    var data:MainData?
    
    func startListen() {
        
        textVue.v_text { () -> String? in
            
            return data?.name
        }
        clickVue.v_on {
            
            self.v_identifier = 1
            print("click")
        }
        tapVue.v_on {
            self.v_identifier = 0
            self.v_selectVue.v_on?()
        }
        
        inputVue.v_input {
            
            print(self.inputVue.v_text)
        }
    }
    
}
class MainData{
    
    var name:String?
    
    
}
