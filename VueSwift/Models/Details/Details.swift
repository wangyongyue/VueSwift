//
//  Details.swift
//  VueSwift
//
//  Created by apple on 2019/5/30.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class Details:Vue,V_ViewControllerProtocol{
    
   
    func v_viewController() -> UIViewController {
        let vc = MainVC()
        vc.vue = self
        vc.navigationItem.title = "详情列表"
        return vc
    }
   
    override func v_start() {
        
        var array = Array<VueData>()
        for i in 1...12{
            
            let m = DetailsModel()
            m.name = "详情"
            array.append(m)
            
        }
        self.v_array(vId: arrayID) { () -> Array<VueData>? in
            
            return array
        }
      
                
    }
    
    
}

class DetailsModel: VueData{
    
  
    var name:String?

    
}

