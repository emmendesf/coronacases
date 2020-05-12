//
//  PreventionTips.swift
//  CovidCases
//
//  Created by Caio Roberto on 30/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class PreventionTipsView: UIView {
    
    private let viewModel: PreventionTipsViewModel
    
    init(viewModel: PreventionTipsViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = CovidCasesFonts.primaryTextFont
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = R.string.localizable.preventionTipsTitle()
        label.textColor = .white
        
        return label
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: .zero)
        pageControl.numberOfPages = viewModel.pages.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = CustomColors.shared.salmon
        pageControl.pageIndicatorTintColor = CustomColors.shared.coronaLightGray
        pageControl.isUserInteractionEnabled = false

        return pageControl
    }()
}

extension PreventionTipsView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(pageControl)
    }
    
    func setupConstraints() {
        titleLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor, constant: 50),
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
        
        pageControl.constraint { view in
            [view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = CustomColors.shared.coronaDarkGray
    }
}

extension PreventionTipsView: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.viewModel.pages.firstIndex(of: viewControllers[0]) {
                  self.pageControl.currentPage = viewControllerIndex
              }
          }
    }
}

extension PreventionTipsView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = viewModel.pages.firstIndex(of: viewController) {
            if viewControllerIndex == 0 {
                return viewModel.pages.last
            } else {
                return self.viewModel.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = viewModel.pages.firstIndex(of: viewController) {
            if viewControllerIndex < viewModel.pages.count - 1 {
                return viewModel.pages[viewControllerIndex + 1]
            } else {
                return viewModel.pages.first
            }
        }
        return nil
    }
}
