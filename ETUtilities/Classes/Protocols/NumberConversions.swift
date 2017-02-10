//
//  CGFloatConvertible.swift
//  ETUtilities
//
//  Created by Jan Čislinský on 10/02/2017.
//
//

import Foundation

// MARK: - Protocols

/// Extends with `cgFloat` variable that converts self to CGFloat.
public protocol CGFloatConvertible {

    var cgFloat: CGFloat { get }
}

/// Extends with `double` variable that converts self to Double.
public protocol DoubleConvertible {

    var double: Double { get }
}

/// Extends with `int` variable that converts self to Int.
public protocol IntConvertible {

    var int: Int { get }
}

// MARK: - Implementation

// MARK: CGFloatConvertible

extension Double: CGFloatConvertible {

    /// Returns self as CGFloat.
    public var cgFloat: CGFloat { return CGFloat(self) }
}

extension Float: CGFloatConvertible {

    /// Returns self as CGFloat.
    public var cgFloat: CGFloat { return CGFloat(self) }
}

extension Int: CGFloatConvertible {

    /// Returns self as CGFloat.
    public var cgFloat: CGFloat { return CGFloat(self) }
}

// MARK: DoubleConvertible

extension CGFloat: DoubleConvertible {

    // Returns self as Double
    public var double: Double { return Double(self) }
}

extension Int: DoubleConvertible {

    // Returns self as Double
    public var double: Double { return Double(self) }
}

// MARK: IntConvertible

extension CGFloat: IntConvertible {

    // Returns self as Int
    public var int: Int { return Int(self) }
}

extension Double: IntConvertible {

    // Returns self as Int
    public var int: Int { return Int(self) }
}
