//
//  CGRect+ET.swift
//  Pods
//
//  Created by Jakub Nižaradze on 19/02/2017.
//
//

import Foundation

public protocol RectAdjustable {
    
    var top: CGFloat { get set }
    var bottom: CGFloat { get set }
    var left: CGFloat { get set }
    var right: CGFloat { get set }
    var center: CGPoint { get set }
    
}

extension CGRect: RectAdjustable {
    
    /// Left coordinate of rect. Calculated using origin.x
    public var left: CGFloat {
        get { return origin.x }
        set { origin.x = newValue }
    }
    
    /// Right coordinate of rect. Calculated using origin.x + width
    public var right: CGFloat {
        get { return origin.x + width }
        set { origin.x = newValue - width }
    }
    
    /// Top coordinate of rect. Calculated using origin.y
    public var top: CGFloat {
        get { return origin.y }
        set { origin.y = newValue }
    }
    
    /// Bottom coordinate of rect. Calculated using origin.y + height
    public var bottom: CGFloat {
        get { return origin.y + height }
        set { origin.y = newValue - height }
    }
    
    /// Center point of rect. Calculated using origin, width and height
    public var center: CGPoint {
        get { return CGPoint(x: origin.x + width / 2, y: origin.y + height / 2) }
        set { origin = CGPoint(x: newValue.x - width / 2, y: newValue.y - height / 2) }
    }
    
}
