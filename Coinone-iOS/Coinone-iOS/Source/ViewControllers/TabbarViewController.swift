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
    self.view.backgroundColor = .clear
    self.selectedIndex = defaultIndex
    self.tabBar.layer.borderWidth = 0.6
//    self.tabBar.layer.borderColor = lineColor.cgColor
  }

}

extension TabbarViewContorller {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let firstTabController =  HomeViewController()
    let secondTabController = TransactionViewController()
    let viewControllers = [firstTabController, secondTabController]
    self.setViewControllers(viewControllers, animated: true)

    let tabBar: UITabBar = self.tabBar
    tabBar.backgroundColor = UIColor.clear
    tabBar.barStyle = UIBarStyle.default
    tabBar.barTintColor = UIColor.white
    
    let imageNames = ["tabHomeInact", "tabSearchInact", "tabCommunityInact", "tabMyInact"]
    let imageSelectedNames = ["tabHomeAct", "tabSearchAct", "tabCommunityAct", "tabMyAct"]

    for (ind, value) in (tabBar.items?.enumerated())! {
      let tabBarItem: UITabBarItem = value as UITabBarItem
      tabBarItem.title = nil
      tabBarItem.image = UIImage(named: imageNames[ind])?.withRenderingMode(.alwaysOriginal)
      tabBarItem.selectedImage = UIImage(named: imageSelectedNames[ind])?.withRenderingMode(.alwaysOriginal)
      tabBarItem.accessibilityIdentifier = imageNames[ind]
      tabBarItem.imageInsets.top = 15
      tabBarItem.imageInsets.bottom = -15
    }
  }
}
