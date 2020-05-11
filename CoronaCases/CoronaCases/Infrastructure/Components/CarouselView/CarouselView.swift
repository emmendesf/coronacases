//
//  CarouselView.swift
//  CovidCases
//
//  Created by Caio Roberto on 12/04/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class CarouselView: UIView {
    private var scrollCallback: ((UIScrollView, Int) -> Void)?
    private let views: [UIView]

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.isPagingEnabled = true
        scrollView.clipsToBounds = false
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.contentSize = CGSize(width: 0, height: self.frame.height)

        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.distribution = .equalSpacing

        return stackView
    }()

    init(views: [UIView], scrollCallback: ((UIScrollView, Int) -> Void)? = nil) {
        self.scrollCallback = scrollCallback
        self.views = views
        super.init(frame: .zero)
        buildView()
        addViewsToStackView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViewsToStackView() {
        views.forEach { (view) in
            stackView.addArrangedSubview(view)
        }
    }
}

extension CarouselView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubviewWithConstraints(subview: scrollView)
        scrollView.addSubviewWithConstraints(subview: stackView)
    }

    func setupConstraints() {

    }
}

extension CarouselView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x/self.frame.width))
        scrollCallback?(scrollView, pageIndex)
    }
}
