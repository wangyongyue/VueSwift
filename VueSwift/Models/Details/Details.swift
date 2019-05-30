//
//  Details.swift
//  VueSwift
//
//  Created by apple on 2019/5/30.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class Details:MainProtocol{
    
    var arrayVue: Vue = Vue()
    var indexVue: Vue = Vue()
    
    func startListen() {
        
        
        loadData()
        
        indexVue.v_index { (index) in
            
            
            let m = self.arrayVue.v_array?[index] as! DetailsModel
            print(m.data?.name)
            print(m.v_identifier)
            if m.v_identifier == 0{
                
                
                
                
                
            }
            
        }
        
        
    }
    
    func getViewController() -> UIViewController {
        
        let vc = MainVC()
        vc.m = self
        vc.navigationItem.title = "详情列表"
        return vc
        
    }
    
    func loadData(){
        
        var array = Array<VueData>()
        for i in 1...12{
            
            let m = DetailsModel()
            let d = DetailsData()
            d.name = "详情"
            m.data = d
            array.append(m)
            
        }
        
        
        arrayVue.v_array(true, v: { () -> Array<VueData>? in
            
            return array
        })
        
        
        
    }
    
    
}
class DetailsModel: VueData,MainCellProtocol{
    
    
    var v_palm: String = "MainCell"
    var v_identifier:Int = 0
    var v_selectVue:Vue = Vue()
    
    
    var textVue:Vue = Vue()
    
    var clickVue:Vue = Vue()
    var tapVue:Vue = Vue()
    var data:DetailsData?
    
    func startListen() {
        
        textVue.v_text { () -> String? in
            
            return data?.name
        }
        clickVue.v_on {
            self.v_identifier = 1
        }
        tapVue.v_on {
            self.v_identifier = 0
            
            self.v_selectVue.v_on?()
        }
        
    }
    
}
class DetailsData{
    
    var name:String?
    
    
}
