//
//  UINavigationController+ViewControllable.swift
//  NaverMovie
//
//  Created by Insu Byeon on 2021/12/05.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import UIKit
import RIBs

extension UINavigationController: ViewControllable {
  public var uiviewController: UIViewController {
    return self
  }
  
  convenience init(root: ViewControllable) {
    self.init(rootViewController: root.uiviewController)
  }
}
