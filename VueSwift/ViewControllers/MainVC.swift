//
//  MainVC.swift
//  VueSwift
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit


class MainVC: UIViewController {

    
    var m:MainProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        
        let table = CTable()
        self.view.addSubview(table)
       
        table.frame = CGRect.init(x: 0, y: 0, width: Screen.width(), height: Screen.height())
        table.register([MainCell.classForCoder()])
        
        if let v = m?.arrayVue{
            table.v_array(vue: v)

        }
        
        if let v = m?.indexVue{
            table.v_index(vue: v)
        }
        
        m?.startListen()
    }

}
protocol MainProtocol {
    
    var arrayVue:Vue{get}
    var indexVue:Vue{get}
    func startListen()

}


class Screen{
    
    static func width() -> CGFloat{
        
        return UIScreen.main.bounds.width
    }
    static func height() -> CGFloat{
        
        return UIScreen.main.bounds.height
    }
}
