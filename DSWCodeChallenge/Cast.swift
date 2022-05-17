//
//  Cast.swift
//  DSWCodeChallenge
//
//  Created by Bradley Calkins on 5/16/22.
//

import Foundation

extension Substring {
    func toInt() -> Int {
        Int(self) ?? -1
    }
    func toFloat() -> Float {
        Float(self) ?? -1
    }
    func toBool() -> Bool {
        self == "true"
    }
}
