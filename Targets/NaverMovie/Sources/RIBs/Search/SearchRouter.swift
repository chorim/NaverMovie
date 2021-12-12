//
//  SearchRouter.swift
//  NaverMovie
//
//  Created by Insu Byeon on 2021/12/05.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import RIBs

protocol SearchInteractable: Interactable {
  var router: SearchRouting? { get set }
  var listener: SearchListener? { get set }
  /// SearchResult RIB이 attach되었을 때 호출되는 함수
  func didAttachSearchResult(_ searchResultViewControllable: SearchResultViewControllable)
}

protocol SearchViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
  func setupViews(_ searchResultViewControllable: SearchResultViewControllable)
}

final class SearchRouter: ViewableRouter<SearchInteractable, SearchViewControllable>, SearchRouting {

  private let searchResultRouter: ViewableRouting
  
  init(
    interactor: SearchInteractable,
    viewController: SearchViewControllable,
    searchResultRouter: SearchResultRouting
  ) {
    self.searchResultRouter = searchResultRouter
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  override func didLoad() {
    super.didLoad()
    
    attachChild(searchResultRouter)
    // Search Result RIB이 attach 되었음을 인터렉터에 알립니다
    guard
      let searchResultViewControllable = searchResultRouter.viewControllable as? SearchResultViewControllable
    else {
      fatalError("SearchResult RIB attach failed. \(type(of: searchResultRouter.viewControllable))")
    }
    
    interactor.didAttachSearchResult(searchResultViewControllable)
  }
}
