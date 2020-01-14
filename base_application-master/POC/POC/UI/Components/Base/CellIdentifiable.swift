//
//  CellIdentifiable.swift
//  POC
//
//  Created by Bruno Vieira on 06/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import Foundation

public protocol CellIndentifiable {
    static var identifier: String { get }
}

public extension CellIndentifiable {
    static var identifier: String {
        return String(describing: type(of: self))
    }
}
