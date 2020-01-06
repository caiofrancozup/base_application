//
//  HomeView.swift
//  POC
//
//  Created by Bruno Vieira on 05/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol HomeViewDelegate: UserViewDelegate, AccountCardViewDelegate, CardCarouselViewDelegate, ShortcutsCarouselViewDelegate {
    
}

class HomeView: CustomView<HomeView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    weak var delegate: HomeViewDelegate? {
        didSet {
            userView.delegate = delegate
            accountCardView.delegate = delegate
            cardCarouselView.delegate = delegate
            shortcutsCarouselView.delegate = delegate
        }
    }

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .yellow
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            userView,
            accountCardView,
            cardCarouselView,
            shortcutsCarouselView,
            bannerView
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
    
    private lazy var accountCardView: AccountCardView = {
        let view = AccountCardView(model: nil)
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
        view.backgroundColor = .orange
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
        addConstraints([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.heightAnchor.constraint(equalToConstant: 500.0).isActive = true
        scrollView.addConstraints([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        
//        stackView.anchorToSafeArea()
//        contentView.anchorToSafeArea()
//        scrollView.anchorToSafeArea()
//
//        userView.anchorSize(height: 60.0)
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.red
    }
}

protocol UserViewDelegate: class {
    
}

class UserView: CustomView<UserView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    weak var delegate: UserViewDelegate?
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .red
    }
    
}

protocol AccountCardViewDelegate: class {
    
}

class AccountCardView: CustomView<AccountCardView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    weak var delegate: AccountCardViewDelegate?
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .green
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
        backgroundColor = .orange
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
