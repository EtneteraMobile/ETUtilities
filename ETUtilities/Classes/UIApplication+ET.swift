//
//  Application+ET.swift
//  ETUtilities
//
//  Created by Jan Čislinský on 13/01/2017.
//
//

import UIKit

public extension UIApplication {

    /// Build number of current app version (like `342`).
    ///
    /// - Note: Uses CFBundleVersion
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 01/2017
    static var et_versionBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }

    /// Current app version name (like `1.0`).
    ///
    /// - Note: Uses CFBundleShortVersionString
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 01/2017
    static var et_versionName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    /// Combination of current build number and app name (like `1.0 (342)`).
    ///
    /// - Note: Uses CFBundleVersion and CFBundleShortVersionString
    ///
    /// - Author: Jan Cislinsky
    /// - Since: 01/2017
    static var et_versionComplete: String? {
        guard let build = et_versionBuild else { return nil }
        guard let name = et_versionName else { return nil }
        return "\(name) (\(build))"
    }
}
