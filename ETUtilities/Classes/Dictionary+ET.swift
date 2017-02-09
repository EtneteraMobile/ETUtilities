//
//  Dictionary+ET.swift
//  ETUtilities
//
//  Created by Jan Čislinský on 13/01/2017.
//
//

import Foundation

// MARK: - Dictionary

public extension Dictionary {

    // MARK: - Map pairs

    /// Map dictionary to dictionary of another type.
    ///
    /// - Parameter transform: Transform function that accept Element from dictionary and returns mapped key and value as a tuple.
    ///
    /// - Returns: Mapped dictionary from transform function.
    ///
    /// - Throws: Exceptions from transform function.
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 01/2017
    func et_mapPairs<OutKey: Hashable, OutValue>(_ transform: (Element) throws -> (OutKey, OutValue)) rethrows -> [OutKey: OutValue] {

        var dict = Dictionary<OutKey, OutValue>()

        try map(transform).forEach { key, value in
            dict[key] = value
        }

        return dict
    }
}

// MARK: - Dictionary with key:String

public extension Dictionary where Key: StringProtocol {

    // MARK: - Key Path access
    // MARK: Any

    /// Returns value from heterogeneous nested dictionary according given keyPath.
    ///
    /// - Parameter et_keyPath: KeyPath that describes path to value.
    ///
    /// - SeeAlso: [Source](https://oleb.net/blog/2017/01/dictionary-key-paths/)
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 01/2017
    subscript(et_keyPath keyPath: KeyPath) -> Any? {
        get {
            switch keyPath.headAndTail {
            case nil:
                // key path is empty.
                return nil
            case let (head, remainingKeyPath)? where remainingKeyPath.isEmpty:
                // Reached the end of the key path.
                let key = Key(string: head)
                return self[key]
            case let (head, remainingKeyPath)?:
                // Key path has a tail we need to traverse.
                let key = Key(string: head)
                switch self[key] {
                case let nestedDict as [Key: Any]:
                    // Next nest level is a dictionary.
                    // Start over with remaining key path.
                    return nestedDict[et_keyPath: remainingKeyPath]
                default:
                    // Next nest level isn't a dictionary.
                    // Invalid key path, abort.
                    return nil
                }
            }
        }
        set {
            switch keyPath.headAndTail {
            case nil:
                // key path is empty.
                return
            case let (head, remainingKeyPath)? where remainingKeyPath.isEmpty:
                // Reached the end of the key path.
                let key = Key(string: head)
                self[key] = newValue as? Value
            case let (head, remainingKeyPath)?:
                let key = Key(string: head)
                let value = self[key]
                switch value {
                case var nestedDict as [Key: Any]:
                    // Key path has a tail we need to traverse
                    nestedDict[et_keyPath: remainingKeyPath] = newValue
                    self[key] = nestedDict as? Value
                default:
                    // Invalid keyPath
                    return
                }
            }
        }
    }

    // MARK: String

    /// Returns String from heterogeneous nested dictionary according given keyPath.
    ///
    /// - Parameter et_string: KeyPath that describes path to value.
    ///
    /// - SeeAlso: [Source](https://oleb.net/blog/2017/01/dictionary-key-paths/)
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 01/2017
    subscript(et_string keyPath: KeyPath) -> String? {
        get { return self[et_keyPath: keyPath] as? String }
        set { self[et_keyPath: keyPath] = newValue }
    }

    // MARK: Dictionary

    /// Returns Dictionary from heterogeneous nested dictionary according given keyPath.
    ///
    /// - Parameter et_dict: KeyPath that describes path to value.
    ///
    /// - SeeAlso: [Source](https://oleb.net/blog/2017/01/dictionary-key-paths/)
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 01/2017
    subscript(et_dict keyPath: KeyPath) -> [Key: Any]? {
        get { return self[et_keyPath: keyPath] as? [Key: Any] }
        set { self[et_keyPath: keyPath] = newValue }
    }

    // MARK: Array

    /// Returns Array from heterogeneous nested dictionary according given keyPath.
    ///
    /// - Parameter et_dict: KeyPath that describes path to value.
    ///
    /// - SeeAlso: [Source](https://oleb.net/blog/2017/01/dictionary-key-paths/)
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 01/2017
    subscript(et_array keyPath: KeyPath) -> [Any]? {
        get { return self[et_keyPath: keyPath] as? [Any] }
        set { self[et_keyPath: keyPath] = newValue }
    }
}

// MARK: - Key Path

public struct KeyPath {
    var segments: [String]

    var isEmpty: Bool { return segments.isEmpty }
    var path: String {
        return segments.joined(separator: ".")
    }

    /// Strips off the first segment and returns a pair
    /// consisting of the first segment and the remaining key path.
    /// Returns nil if the key path has no segments.
    var headAndTail:(head: String, tail: KeyPath)? {
        guard !isEmpty else { return nil }
        var tail = segments
        let head = tail.removeFirst()
        return (head, KeyPath(segments: tail))
    }
}

/// Initializes a KeyPath with a string of the form "this.is.a.keypath"
public extension KeyPath {
    init(_ string: String) {
        segments = string.components(separatedBy: ".")
    }
}

extension KeyPath: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }
    public init(unicodeScalarLiteral value: String) {
        self.init(value)
    }
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(value)
    }
}

// MARK: - String protocol for key conformance to String

// Needed because Swift 3.0 doesn't support extensions with concrete
// same-type requirements (extension Dictionary where Key == String).
public protocol StringProtocol {
    init(string s: String)
}

extension String: StringProtocol {
    public init(string s: String) {
        self = s
    }
}

