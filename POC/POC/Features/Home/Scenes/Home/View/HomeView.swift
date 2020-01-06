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
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            userView,
//            accountCardView,
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
        let view = RoundShadowView(model: RoundShadowView.Model(subview: AccountCardView(model: nil)))
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

protocol AccountCardViewDelegate: class {
    
}

class AccountCardView: CustomView<AccountCardView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    weak var delegate: AccountCardViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Blablabla"
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "tttt"
        return label
    }()
    
    private lazy var detailsButton: UIButton = {
        let button = UIButton()
        button.setTitle("DETAILS", for: .normal)
        button.setTitleColor(Colors.lightBlue, for: .normal)
        return button
    }()
    
    private lazy var textContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.blue
        return view
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(contentView)
        contentView.addSubview(textContainerView)
        contentView.addSubview(detailsButton)
        textContainerView.addSubview(titleLabel)
        textContainerView.addSubview(valueLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.anchorToSuperview(topConstant: Margins.default,
                                      leftConstant: Margins.default,
                                      bottomConstant: Margins.default,
                                      rightConstant: Margins.default)
        
        textContainerView.translatesAutoresizingMaskIntoConstraints = false
        textContainerView.anchorMargins(top: contentView.top,
                                        left: contentView.left,
                                        bottom: contentView.bottom,
                                        topConstant: Margins.default,
                                        leftConstant: Margins.default,
                                        bottomConstant: Margins.default)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.anchorMargins(top: textContainerView.top,
                                 left: textContainerView.left,
                                 right: textContainerView.right,
                                 topConstant: Margins.zero,
                                 leftConstant: Margins.zero,
                                 rightConstant: Margins.zero)

        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.anchorMargins(top: titleLabel.bottom,
                                 left: textContainerView.left,
                                 bottom: textContainerView.bottom,
                                 right: textContainerView.right,
                                 topConstant: Margins.zero,
                                 leftConstant: Margins.zero,
                                 bottomConstant: Margins.zero,
                                 rightConstant: Margins.zero)
        
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([
            detailsButton.leftAnchor.constraint(equalTo: textContainerView.rightAnchor, constant: Margins.default),
            detailsButton.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: Margins.default),
            detailsButton.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -Margins.default),
            detailsButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Margins.default),
            detailsButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        titleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        valueLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        detailsButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textContainerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .white
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
