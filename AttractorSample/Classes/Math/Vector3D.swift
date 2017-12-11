//
//  Vector3D.swift
//  AttractorSample
//
//  Created by SuguruSasaki on 2017/12/11.
//  Copyright © 2017年 quad. All rights reserved.
//

import Foundation
import UIKit

struct Vector3D {
    
    var x:CGFloat
    var y:CGFloat
    var z:CGFloat
    
    var length:CGFloat {
        return sqrt(self.lengthSqrt)
    }
    
    var lengthSqrt:CGFloat {
        return x * x + y * y + z * z
    }
    
    var normalize: Vector3D {
        let len = 1/self.length
        return Vector3D(x: self.x*len,
                        y: self.y*len,
                        z: self.z*len)
    }
    
    /// 2点館の距離
    ///
    /// - Parameter v: Vector3D
    /// - Returns: length
    func distance(v:Vector3D) -> CGFloat {
        let dx = self.x - v.x
        let dy = self.y - v.y
        let dz = self.z - v.z
        return sqrt(dx * dx + dy * dy + dz * dz)
    }
    
    /// 外積
    ///
    /// - Parameter v: Vector3D
    /// - Returns: instance of cross product
    func cross(v:Vector3D) -> Vector3D {
        return Vector3D(x: self.y * v.z - self.z * v.y,
                        y: self.z * v.x - self.x * v.z,
                        z: self.x * v.y - self.y * v.x)
    }
    
    /// 内積
    ///
    /// - Parameter v: Vector3D
    /// - Returns: instance of Dot product
    func dot(v:Vector3D) -> CGFloat {
        return self * v
    }
    
    static func *= (lhs: inout Vector3D, scale:CGFloat) -> Void {
        lhs.x *= scale
        lhs.y *= scale
        lhs.z *= scale
    }
    
    static func /= (lhs: inout Vector3D, scale:CGFloat) -> Void {
        let len = 1/scale
        lhs.x *= len
        lhs.y *= len
        lhs.z *= len
    }
    
    static func += (lhs: inout Vector3D, rhs:Vector3D) -> Void {
        lhs.x += rhs.x
        lhs.y += rhs.y
        lhs.z += rhs.z
    }
    
    static func -= (lhs: inout Vector3D, rhs:Vector3D) -> Void {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
        lhs.z -= rhs.z
    }
    
    static func == (lhs: Vector3D, rhs: Vector3D) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }
    
    static func + (lhs:Vector3D, rhs:Vector3D) -> Vector3D {
        return Vector3D(x: lhs.x + rhs.x, y: lhs.y + rhs.y, z: lhs.z + rhs.z)
    }

    static func - (lhs:Vector3D, rhs:Vector3D) -> Vector3D {
        return Vector3D(x: lhs.x - rhs.x, y: lhs.y - lhs.y, z: lhs.z - rhs.z)
    }
    
    
    /// dot product
    ///
    /// - Parameters:
    ///   - lhs: Vector3D
    ///   - rhs: Vector3D
    /// - Returns: dot
    static func * (lhs:Vector3D, rhs:Vector3D) -> CGFloat {
        return lhs.x * rhs.x + lhs.y + rhs.y + lhs.z * rhs.z
    }
    
    /// Zeroベクトルを取得
    ///
    /// - Returns: instance of Zero Vector3D
    static func zero() -> Vector3D {
        return Vector3D(x: 0, y: 0, z: 0)
    }
}

