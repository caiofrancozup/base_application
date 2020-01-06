//
//  HomeView.swift
//  POC
//
//  Created by Bruno Vieira on 05/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol HomeViewDelegate: UserViewDelegate, AccountSummaryViewDelegate, CardCarouselViewDelegate, ShortcutsCarouselViewDelegate {
    
}

class HomeView: CustomView<HomeView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    weak var delegate: HomeViewDelegate? {
        didSet {
            userView.delegate = delegate
//            accountCardView.delegate = delegate
            cardCarouselView.delegate = delegate
            shortcutsCarouselView.delegate = delegate
        }
    }

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = Colors.white
        scrollView.contentInset = UIEdgeInsets(top: Margins.zero,
                                               left: Margins.zero,
                                               bottom: Margins.large,
                                               right: Margins.zero)
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            userView,
            accountCardView,
            cardCarouselView,
            shortcutsCarouselView,
            bannerCardView
        ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var userView: UserView = {
        let view = UserView(model: nil)
        return view
    }()
    
    private lazy var accountCardView: RoundShadowView = {
        let view = RoundShadowView(model: RoundShadowView.Model(subview: AccountSummaryView(model: nil)))
        return view
    }()
    
    private lazy var cardCarouselView: CardCarouselView = {
        let view = CardCarouselView(model: nil)
        return view
    }()
    
    private lazy var shortcutsCarouselView: ShortcutsCarouselView = {
        let view = ShortcutsCarouselView(model: nil)
        return view
    }()
    
    private lazy var bannerCardView: RoundShadowView = {
        let view = RoundShadowView(model: RoundShadowView.Model(subview: bannerView))
        return view
    }()
    
    private lazy var bannerView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        translatesAutoresizingMaskIntoConstraints = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.anchorToSafeArea()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addConstraints([
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.anchorToSafeArea()
        
        cardCarouselView.translatesAutoresizingMaskIntoConstraints = false
        cardCarouselView.anchorSize(height: 300.0)
        
        shortcutsCarouselView.translatesAutoresizingMaskIntoConstraints = false
        shortcutsCarouselView.anchorSize(height: 200.0)
        
        bannerCardView.translatesAutoresizingMaskIntoConstraints = false
        bannerCardView.anchorSize(height: 300.0)
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.white
    }
}

protocol CardCarouselViewDelegate: class {
    
}

class CardCarouselView: CustomView<CardCarouselView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    weak var delegate: CardCarouselViewDelegate?
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .brown
    }
    
}

protocol ShortcutsCarouselViewDelegate: class {
    
}

class ShortcutsCarouselView: CustomView<ShortcutsCarouselView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    weak var delegate: ShortcutsCarouselViewDelegate?
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .blue
    }
    
}
