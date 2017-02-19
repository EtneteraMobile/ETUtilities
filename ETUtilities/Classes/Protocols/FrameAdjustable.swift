//
//  Extension can be used on everything containing frame to enhance ability to manipulate it.
//
//  FrameAdjustable.swift
//  Pods
//
//  Created by Jakub Nižaradze on 19/02/2017.
//
//

import Foundation

protocol FrameAdjustable: class, RectAdjustable {
    
    var frame: CGRect { get set }
    var width: CGFloat { get set }
    var height: CGFloat { get set }
    
}

extension FrameAdjustable {
    
    /// Width of frame. Calculated using frame.width
    public var width: CGFloat {
        get { return frame.width }
        set { frame.size.width = newValue }
    }
    
    /// Height of frame. Calculated using frame.height
    public var height: CGFloat {
        get { return frame.height }
        set { frame.size.height = newValue }
    }
    
    /// Left coordinate of frame. Calculated using frame.origin.x
    public var left: CGFloat {
        get { return frame.left }
        set { frame.left = newValue }
    }
    
    /// Right coordinate of frame. Calculated using frame.origin.x + frame.width
    public var right: CGFloat {
        get { return frame.right }
        set { frame.right = newValue }
    }
    
    /// Top coordinate of frame. Calculated using frame.origin.y
    public var top: CGFloat {
        get { return frame.top }
        set { frame.top = newValue }
    }
    
    /// Bottom coordinate of frame. Calculated using frame.origin.y + frame.height
    public var bottom: CGFloat {
        get { return frame.bottom }
        set { frame.bottom = newValue }
    }
    
    
    /// Center point of frame. Calculated using frame.origin, frame.width and frame.height
    public var center: CGPoint {
        get { return frame.center }
        set { frame.center = newValue }
    }
}

extension UIView: FrameAdjustable {}
extension CALayer: FrameAdjustable {}
