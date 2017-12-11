//
//  Canvas.swift
//  AttractorSample
//
//  Created by SuguruSasaki on 2017/12/10.
//  Copyright © 2017年 quad. All rights reserved.
//

import UIKit

class Canvas: UIView {

    private var eagleContext:EAGLContext?
    
    private var clearColor:UIColor = UIColor.clear
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(clearColor:UIColor) {
        super.init(frame: UIScreen.main.bounds)
        self.clearColor = clearColor
    }
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = self.clearColor
       
    }
}
