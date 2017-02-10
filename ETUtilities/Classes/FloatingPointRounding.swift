//
//  FloatingPointRounding
//  ETUtilities
//
//  Created by Jan Čislinský on 09/02/2017.
//
//

import Foundation

// MARK: - Float

public func round(_ value: Float, toNearest: Float) -> Float {
    return round(value / toNearest) * toNearest
}

public func floor(_ value: Float, toNearest: Float) -> Float {
    return floor(value / toNearest) * toNearest
}

public func ceil(_ value: Float, toNearest: Float) -> Float {
    return ceil(value / toNearest) * toNearest
}

// MARK: - CGFloat

public func round(_ value: CGFloat, toNearest: Double) -> CGFloat {
    return CGFloat(round(Double(value) / toNearest) * toNearest)
}

public func floor(_ value: CGFloat, toNearest: Double) -> CGFloat {
    return CGFloat(floor(Double(value) / toNearest) * toNearest)
}

public func ceil(_ value: CGFloat, toNearest: Double) -> CGFloat {
    return CGFloat(ceil(Double(value) / toNearest) * toNearest)
}

// MARK: - Double

public func round(_ value: Double, toNearest: Double) -> Double {
    return round(value / toNearest) * toNearest
}

public func floor(_ value: Double, toNearest: Double) -> Double {
    return floor(value / toNearest) * toNearest
}

public func ceil(_ value: Double, toNearest: Double) -> Double {
    return ceil(value / toNearest) * toNearest
}
