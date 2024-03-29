//
//  TabbarViewController.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/17.
//

import Foundation
import UIKit

class TabbarViewContorller: UITabBarController {
  
  var defaultIndex = 0 {
    didSet {
      self.selectedIndex = defaultIndex
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.selectedIndex = defaultIndex
  }

}

extension TabbarViewContorller {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let storyBoard = UIStoryboard(name: "My", bundle: nil)
    let firstNavigationController = UINavigationController()
    guard let firstTabController = storyBoard.instantiateViewController(identifier: "MyViewController") as? MyViewController else { return }
    firstNavigationController.addChild(firstTabController)
    
    let secondNavigationController = UINavigationController()
    let secondTabController = GeoraesoVC()
    secondNavigationController.addChild(secondTabController)
    
    let emptyNavigationController = UINavigationController()
    let emptyTabController = HomeViewController()
    emptyNavigationController.addChild(emptyTabController)
    
    let secondEmptyNavigationController = UINavigationController()
    let secondEmptyTabController = TransactionViewController()
    secondEmptyNavigationController.addChild(secondEmptyTabController)
    
    let viewControllers = [firstNavigationController, secondNavigationController, emptyNavigationController, secondEmptyNavigationController]
    self.setViewControllers(viewControllers, animated: true)
    
    let tabBar: UITabBar = self.tabBar
    tabBar.backgroundColor = UIColor.clear
    tabBar.barTintColor = UIColor.white
    tabBar.isHidden = false
    
    let imageNames = ["homeButton", "assetButton", "plusButton", "moreButton"]
    let imageSelectedNames = ["homeButton", "assetButton", "plusButton", "moreButton"]

    for (ind, value) in (tabBar.items?.enumerated())! {
      let tabBarItem: UITabBarItem = value as UITabBarItem
      tabBarItem.title = nil
      tabBarItem.image = UIImage(named: imageNames[ind])?.withRenderingMode(.alwaysOriginal)
      tabBarItem.selectedImage = UIImage(named: imageSelectedNames[ind])?.withRenderingMode(.alwaysOriginal)
      tabBarItem.accessibilityIdentifier = imageNames[ind]
      tabBarItem.imageInsets.left = 4
    }
    self.hidesBottomBarWhenPushed = false
  }
}
