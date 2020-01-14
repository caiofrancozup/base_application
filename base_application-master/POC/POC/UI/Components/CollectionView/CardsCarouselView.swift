//
//  CardsCarouselView.swift
//  POC
//
//  Created by Bruno Vieira on 06/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol CardCarouselViewDelegate: class {
    
}

class CardsCarouselView: CustomView<CardsCarouselView.Model?>, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionCell.identifier, for: indexPath)
        return cell
    }
    
    
    struct Model: CustomViewModel {
        
    }
    
    weak var delegate: CardCarouselViewDelegate?
    
    private lazy var sectionHeaderView: SectionHeaderView = {
        let view = SectionHeaderView(model: nil)
        return view
    }()
    
    private lazy var carouselCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 300, height: 170)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 5.0, left: Margins.default, bottom: 10.0, right: Margins.default)
        collectionView.bounces = false
        collectionView.register(CardCollectionCell.self, forCellWithReuseIdentifier: CardCollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sectionHeaderView,
                                                       carouselCollectionView])
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
        
        carouselCollectionView.anchorSize(height: 185)
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.white
    }
    
}
