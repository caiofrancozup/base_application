//
//  TableViewCell.swift
//  POC
//
//  Created by Bruno Vieira on 06/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

public class TableViewCell<M: CustomViewModel>: UITableViewCell, CellIndentifiable, CustomViewProtocol {
    public var model: M {
        get { return _model }
        set { _model = newValue }
    }

    private var _model: M! {
        didSet { didUpdateModel() }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        initLayout()

        clipsToBounds = true
        selectionStyle = .none
    }

    open func didUpdateModel() {}
    
    open func createSubviews() {}
    
    open func addSubViews() {}
    
    open func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
