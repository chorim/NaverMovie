//
//  RootRouter.swift
//  NaverMovie
//
//  Created by Insu Byeon on 2021/12/05.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import RIBs
import UIKit

protocol RootInteractable: Interactable, SearchListener {
  var router: RootRouting? { get set }
  var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
  func present(_ viewController: ViewControllable, animated: Bool)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
  
  private let searchBuilder: SearchBuildable
  private var searchRouting: SearchRouting?
  
  // TODO: Constructor inject child builder protocols to allow building children.
  init(
    interactor: RootInteractable,
    viewController: RootViewControllable,
    searchBuilder: SearchBuildable
  ) {
    self.searchBuilder = searchBuilder
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  // MARK: - RootRouting
  func presentToSearch() {
    print("present")
    let searchRouting = searchBuilder.build(withListener: interactor)
    self.searchRouting = searchRouting
    attachChild(searchRouting)
    
    let navigationController = UINavigationController(root: searchRouting.viewControllable)
    
    viewController.present(navigationController, animated: false)
  }
}
