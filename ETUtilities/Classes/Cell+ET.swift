//
//  Cell+ET.swift
//  ETUtilities
//
//  Created by Jan Čislinský on 09/02/2017.
//
//

import Foundation

/// Cell is identified by it's Type description.
public protocol IdentifiedCell {

    var et_reuseId: String { get }
}

public extension IdentifiedCell {

    /// Returns description of Type that contains name of class and it's module.
    ///
    ///     class MyCell: UITableViewCell {}
    ///     let cell = MyCell()
    ///     print(cell.et_reuseId)
    ///     // prints "MyCell in MODULE_ID"
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 02/2017
    var et_reuseId: String {
        return String(describing: type(of: self))
    }
}
