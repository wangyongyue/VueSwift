//
//  MainVC.swift
//  VueSwift
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import os_object


let arrayID = "mainID"
let indexID = "indexID"
let labelID = "labelID"

class MainVC: UIViewController {

    var vue:Vue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        Vue.register(aClass: DetailsModel.classForCoder(), toClass: DetailsCell.classForCoder())
        Vue.register(aClass: MainModel.classForCoder(), toClass: MainCell.classForCoder())

        let table = CTable()
        self.view.addSubview(table)
        table.frame = CGRect.init(x: 0, y: 0, width: Screen.width(), height: Screen.height())
        
        table.v_array(vId: arrayID, vue: vue)
        table.v_index(vId: indexID, vue: vue)
        
        
        let label = UILabel()
        label.textColor = UIColor.red
        label.frame = CGRect.init(x: 100, y: 200, width: 100, height: 50)
        self.view.addSubview(label)
        label.text = "sdfs"
        
        label.v_text(vId: labelID, vue: vue)
        vue?.v_start()

        
    }
   
}



class Screen{
    
    static func width() -> CGFloat{
        
        return UIScreen.main.bounds.width
    }
    static func height() -> CGFloat{
        
        return UIScreen.main.bounds.height
    }
}
