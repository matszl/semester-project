//
//  Math.swift
//  Endless
//
//  Created by Mate Szlanka on 2018. 03. 11..
//  Copyright © 2018. mateszlanka. All rights reserved.
//

import Foundation
import CoreGraphics

class Math {
    static let shared: Math = Math()
    
    private let DegreesPerRadians = Float(Double.pi/180.0)
    private let RadiansPerDegrees = Float(180.0/Double.pi)
    
    func convertToRadians(angle:Float) -> Float {
        return angle * self.DegreesPerRadians
    }
    
    func convertToRadians(angle:CGFloat) -> CGFloat {
        return CGFloat(CGFloat(angle) * CGFloat(self.DegreesPerRadians))
    }
    
    func convertToDegrees(angle:Float) -> Float {
        return angle * self.RadiansPerDegrees
    }
    
    func convertToDegrees(angle:CGFloat) -> CGFloat {
        return CGFloat(CGFloat(angle) * CGFloat(self.RadiansPerDegrees))
    }
}
