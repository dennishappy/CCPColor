//
//  ViewController.swift
//  CCPColor
//
//  Created by 储诚鹏 on 17/2/16.
//  Copyright © 2017年 chengpeng.chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = [UIColor.rgb([30]),UIColor.rgb([30,90,120]),UIColor.hex("#8D24FF")].gradient() {
            $0.locations = [0.2,0.6,1.0]
            $0.bounds = self.view.bounds
            $0.frame = self.view.frame
            return $0
        }
        view.layer.addSublayer(gradient)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

