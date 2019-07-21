//
//  Main.swift
//  VueSwift
//
//  Created by apple on 2019/5/30.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class Main:Vue,V_ViewControllerProtocol{

    
    func v_viewController() -> UIViewController {
        let vc = MainVC()
        vc.vue = self
        vc.navigationItem.title = "列表"
        return vc
    }
    override func v_start() {
        
        var array = Array<VueData>()
        for i in 1...12{
            
            let m = MainModel()
            m.name = "数据"
            array.append(m)
            
        }
        self.v_array(vId: arrayID) { () -> Array<VueData>? in
            
            return array
        }
        self.v_index(vId: indexID) { (index) in
            
            let m = array[index] as! MainModel
            print(m.name)
            print(m.v_identifier)
            if m.v_identifier == 0{

                Router.push(Details(), ["id":"10"], nil)

            }

        }
        self.v_text(vId: labelID) { () -> String? in
            
            return "abcdefg"

        }
        
    }
    
    
}
class MainModel: VueData{

    var name:String?
    override func v_height() -> CGFloat {
        return 100
    }
    
}

