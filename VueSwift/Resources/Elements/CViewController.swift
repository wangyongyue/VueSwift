//
//  CViewController.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
public typealias popCallBack = (_ obj:AnyObject?) -> ()
open class CViewController: UIViewController {
    public var params:[String:Any]?
    
    public var call:popCallBack?
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    


}
