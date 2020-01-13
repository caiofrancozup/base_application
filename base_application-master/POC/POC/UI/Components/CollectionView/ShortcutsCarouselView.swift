//
//  ShortcutsCarouselView.swift
//  POC
//
//  Created by Bruno Vieira on 06/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol ShortcutsCarouselViewDelegate: class {
    
}

class ShortcutsCarouselView: CustomView<ShortcutsCarouselView.Model?>, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortcutCollectionCell.identifier, for: indexPath)
        return cell
    }
    
    struct Model: CustomViewModel {
        
    }
    
    weak var delegate: ShortcutsCarouselViewDelegate?
    
    private lazy var sectionHeaderView: SectionHeaderView = {
        let view = SectionHeaderView(model: nil)
        return view
    }()
    
    private lazy var shortcutsCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(ShortcutCollectionCell.self, forCellWithReuseIdentifier: ShortcutCollectionCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 5.0, left: Margins.default, bottom: 15.0, right: Margins.default)
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sectionHeaderView,
                                                       shortcutsCollectionView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(stackView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.anchorToSuperview()
        
        shortcutsCollectionView.anchorSize(height: 120.0)
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.white
    }
    
}
