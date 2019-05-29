//
//  MainTemplate.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class MainCell: CTableCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let label = CLabel()
        self.contentView.addSubview(label)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 10)
        label.frame = CGRect.init(x: 20, y: 0, width:Screen.width()/2 - 20, height: 30)
        
        let button = CButton()
        button.setTitle("点赞", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        self.contentView.addSubview(button)
        button.frame = CGRect.init(x: Screen.width()/2, y: 0, width: Screen.width()/2 - 20, height: 30)

        
        let h = MainHolder()
        label.v_text(vue: h.vue)
        button.v_on(vue: h.clickVue)
        

        let g = CGesture.init(vue: h.tapVue)
        self.contentView.addGestureRecognizer(g)
        
        
        holder = h

    }
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override func setModel(_ amodel: VueData) {
        super.setModel(amodel)
        
        holder?.setModel(amodel)
    }


}


class MainModel: VueData {


    override init() {
        super.init()
        v_palm = "MainCell"
    }

    var name:String?

}
class MainHolder: Holder {
    var vue = Vue()
    var clickVue = Vue()
    var tapVue = Vue()
    
    override func setModel(_ amodel: VueData) {
        super.setModel(amodel)
        if amodel is MainModel{
            let a = amodel as! MainModel
            //            ob.v_text = a.name
            
            vue.v_text { () -> String? in
                
                return a.name
            }
            
            clickVue.v_on {
                
                a.eventIdentifier = 1
                self.v_selectVue.v_on?()
                
            }
           
            tapVue.v_on {
                
                a.eventIdentifier = 0
                self.v_selectVue.v_on?()
            }
            
            
        }
    }
    
    
}
