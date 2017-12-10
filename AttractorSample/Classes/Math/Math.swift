//
//  Math.swift
//  AttractorSample
//
//  Created by SuguruSasaki on 2017/12/10.
//  Copyright © 2017年 quad. All rights reserved.
//

import Foundation
import UIKit

struct Math {
    
    
    /// ランダム値
    ///
    /// - Parameters:
    ///   - lowerValue: min value
    ///   - upperValue: max value
    /// - Returns: CGFloat
    func random(lowerValue: CGFloat, upperValue: CGFloat) -> CGFloat {
        let result = CGFloat(arc4random_uniform(UInt32(upperValue - lowerValue + 1))) +   lowerValue
        return result
    }
}

