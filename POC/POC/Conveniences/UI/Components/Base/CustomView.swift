//
//  CustomView.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

public protocol ViewCoding {
    func initLayout()
    func createSubviews()
    func addSubViews()
    func setupConstraints()
}

extension ViewCoding {

    public func initLayout() {
        createSubviews()
        addSubViews()
        setupConstraints()
    }
}

public protocol CustomViewProtocol: UIView, UpdatableModel, ViewCoding {  }

open class CustomView<M: CustomViewModel>: UIView, CustomViewProtocol {

    public var model: M {
        didSet {
            didUpdateModel()
        }
    }

    public init(model: M, frame: CGRect = .zero) {
        self.model = model
        super.init(frame: frame)
        configure()
    }

    required public init?(coder: NSCoder) {
        fatalError("This View can't be used in IB because it's using generics. If you want to support IB, implement CustomViewProtocol instead of subclassing CustomView")
    }

    public func configure() {
        initLayout()
        didUpdateModel()
    }

    open func didUpdateModel() {}
    
    open func createSubviews() {}

    open func addSubViews() {
        clipsToBounds = true
    }

    open func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        for view in subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
