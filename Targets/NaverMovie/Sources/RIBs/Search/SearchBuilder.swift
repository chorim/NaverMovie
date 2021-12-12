//
//  SearchBuilder.swift
//  NaverMovie
//
//  Created by Insu Byeon on 2021/12/05.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import RIBs

protocol SearchDependency: Dependency, SearchResultDependency {
}

final class SearchComponent: Component<SearchDependency> {
//  var searchResultViewControllable: SearchResultViewControllable
//
//  init(
//    dependency: SearchDependency,
//    searchResultViewControllable: SearchResultViewControllable
//  ) {
//    self.searchResultViewControllable = searchResultViewControllable
//    super.init(dependency: dependency)
//  }
}

// MARK: - Builder

protocol SearchBuildable: Buildable {
  func build(withListener listener: SearchListener) -> SearchRouting
}

final class SearchBuilder: Builder<SearchDependency>, SearchBuildable {
  
  override init(dependency: SearchDependency) {
    super.init(dependency: dependency)
  }
  
  func build(withListener listener: SearchListener) -> SearchRouting {
    let searchResultRouter = SearchResultBuilder(dependency: dependency).build(withListener: listener)

    let component = SearchComponent(dependency: dependency)
    let viewController = SearchViewController()
    let interactor = SearchInteractor(presenter: viewController)
    interactor.listener = listener
    return SearchRouter(
      interactor: interactor,
      viewController: viewController,
      searchResultRouter: searchResultRouter
    )
  }
}
