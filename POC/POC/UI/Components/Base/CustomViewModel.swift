//
//  CustomViewModel.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import Foundation

public protocol CustomViewModel {  }

public struct EmptyModel: CustomViewModel {  }

extension Optional: CustomViewModel where Wrapped: CustomViewModel {  }

public protocol UpdatableModel {
    associatedtype M: CustomViewModel

    var model: M { get set }

    func didUpdateModel()
}
