//
//  NewsContainerViewController.swift
//  SouthWeekend
//
//  Created by 随随意 on 17/2/6.
//  Copyright © 2017年 suisuiyi. All rights reserved.
//

import UIKit

class NewsContainerViewController: BaseViewController, UIPageViewControllerDataSource {
    var pageViewController: UIPageViewController!
    var viewControllers: [NewsViewController] = []
    var currentIndex = 0
    var topSpace: CGFloat = NavigationBarHeight
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewControllers()
        configureCollectionView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    private func configureCollectionView() {
        
    }

    private func loadViewControllers() {
        if pageViewController == .none {
            configurePageViewController()
        }
        pageViewController.view.frame = CGRect(x: 0, y: NavigationBarHeight, width: view.frame.size.width, height: view.frame.size.height - topSpace - TabBarHeight)
        viewControllers = contentViewControllers()
        pageViewController.setViewControllers([viewControllers[0]], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
        
    }
    private func configurePageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        pageViewController.view.backgroundColor = ResourceProvider.backgroundColor()
        pageViewController.view.frame = CGRect(x: 0, y: NavigationBarHeight, width: view.frame.size.width, height: view.frame.size.height - topSpace - TabBarHeight)
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParentViewController: self)
        
    }
   private func contentViewControllers() -> [NewsViewController] {
    let count = 7
    var vcs: [NewsViewController] = []
    for i in 0..<count {
       let vc = storyboard?.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
       vc.pageIndex = i
       vcs.append(vc)
    }
        return vcs
    }
    func setViewControllers(index: Int) {
        if currentIndex == index {
            return()
        }
        let directionr = (currentIndex > index) ? UIPageViewControllerNavigationDirection.reverse :
            UIPageViewControllerNavigationDirection.forward
        pageViewController.setViewControllers([viewControllers[index]], direction: directionr, animated: true, completion: nil)
        currentIndex = index
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let vc = viewController as? NewsViewController {
            let index = vc.pageIndex
            if index == 0 {
                return .none
            }
            return viewControllers[index - 1]
        }
        return .none
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let vc = viewController as? NewsViewController {
            let index = vc.pageIndex
            if index == viewControllers.count - 1 {
                return .none
            }
            return viewControllers[index + 1]
        }
        return .none

    }
    
}

// MARK: - UIPageViewControllerDelegate
extension NewsContainerViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        currentIndex = (pendingViewControllers.first as! NewsViewController).pageIndex
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        //??????????
        if !completed {
                    currentIndex = (previousViewControllers.first as! NewsViewController).pageIndex
            
        }
        
    }
}

