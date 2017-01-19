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

public extension RangeReplaceableCollection where Iterator.Element: Equatable {

    /// Removes and returns specified element.
    ///
    /// All the elements following the specified element are moved to close the
    /// gap. This example removes the middle element from an array of
    /// measurements.
    ///
    ///     var measurements = [1.2, 1.5, 2.9, 1.1, 1.6]
    ///     let removed = measurements.et_remove(2.9)
    ///     print(measurements)
    ///     // Prints "[1.2, 1.5, 1.2, 1.6]"
    ///
    /// Calling this method may invalidate any existing indices for use with this
    /// collection.
    ///
    /// - Parameter element: The element to remove.
    /// - Returns: The removed element.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 01/2017
    mutating func et_remove(_ element: Self.Iterator.Element) -> Self.Iterator.Element {
        
        // Element never exists in collection
        guard let idx = index(of: element) else { return element }

        // Removes element at index
        return remove(at: idx)
    }

    /// Removes specified elements from the collection.
    ///
    /// All the elements following the specified elements are moved to close the
    /// gap. This example removes the first part of an array of
    /// measurements.
    ///
    ///     var measurements = [1.2, 1.5, 2.9, 1.1, 1.6]
    ///     let removed = measurements.et_remove([1.2, 1.5, 2.9])
    ///     print(measurements)
    ///     // Prints "[1.1, 1.6]"
    ///
    /// Calling this method may invalidate any existing indices for use with this
    /// collection.
    ///
    /// - Parameter elements: The array of elements to remove.
    ///
    /// - Complexity: O(*m* * *n*), where *m* is the length of the collection of
    /// specified elements and *n* is the length of the collection.
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 01/2017
    mutating func et_remove(_ elements: [Self.Iterator.Element]) {

        // Removes all elements one by one
        elements.forEach { et_remove($0) }
    }
}
