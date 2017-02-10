//
//  DeviceDependable.swift
//  ETUtilities
//
//  Created by Jan Čislinský on 09/02/2017.
//
//

import Foundation
import DeviceKit

/// Designs methods for adjusment of self with different given value according
/// current device.
public protocol DeviceDependable {
    func et_replace(with value: Self, on device: Device) -> Self
    func et_replace(with value: Self, onDiagonalOf device: Device) -> Self
}

extension DeviceDependable {

    /// Returns adjusted value if given device is same as current device,
    /// otherwise returns unchanged self.
    ///
    /// - Parameters:
    ///   - value: Value that will be returned if devices are same.
    ///   - device: Device for which is value intended.
    /// - Returns: Adjusted value or self according given device.
    public func et_replace(with value: Self, on device: Device) -> Self {

        if UIDevice.et_this == device {
            return value
        }
        else {
            return self
        }
    }

    /// Returns adjusted value if given device.diagonal is same as current
    /// device.diagonal, otherwise returns unchanged self.
    ///
    /// - Parameters:
    ///   - value: Value that will be returned if devices diagonals are same.
    ///   - device: Device for which is value intended.
    /// - Returns: Adjusted value or self according given device.
    public func et_replace(with value: Self, onDiagonalOf device: Device) -> Self {

        if UIDevice.et_this.diagonal == device.diagonal {
            return value
        }
        else {
            return self
        }
    }
}

extension String: DeviceDependable {}
extension CGFloat: DeviceDependable {}
extension Int: DeviceDependable {}
extension Double: DeviceDependable {}
