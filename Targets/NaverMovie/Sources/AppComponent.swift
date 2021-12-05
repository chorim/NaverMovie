//
//  AppComponent.swift
//  NaverMovie
//
//  Created by Insu Byeon on 2021/12/05.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import RIBs

final class AppComponent: Component<EmptyComponent>, RootDependency {
  init() {
    super.init(dependency: EmptyComponent())
  }
}

