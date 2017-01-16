//
//  NSArray+ET.swift
//  Pods
//
//  Created by Jan Čislinský on 12/01/2017.
//
//

import Foundation

public extension Collection where Indices.Iterator.Element == Index {

    /// Returns the element at the specified index if it is within bounds,
    /// otherwise nil.
    ///
    /// - Parameter index: Index of element
    ///
    /// - Returns: Element at given index or nil
    ///
    /// - SeeAlso: [Source](http://stackoverflow.com/a/30593673)
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 01/2017
    subscript (et_safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
