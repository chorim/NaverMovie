//
//  RootRouter.swift
//  NaverMovie
//
//  Created by Insu Byeon on 2021/12/05.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable {
  var router: RootRouting? { get set }
  var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
  
  // TODO: Constructor inject child builder protocols to allow building children.
  override init(interactor: RootInteractable, viewController: RootViewControllable) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
