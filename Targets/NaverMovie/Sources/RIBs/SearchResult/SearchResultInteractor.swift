//
//  SearchResultInteractor.swift
//  NaverMovie
//
//  Created by Insu Byeon on 2021/12/13.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import RIBs
import RxSwift

protocol SearchResultRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SearchResultPresentable: Presentable {
  var listener: SearchResultPresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SearchResultListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SearchResultInteractor: PresentableInteractor<SearchResultPresentable>, SearchResultInteractable, SearchResultPresentableListener {
  
  weak var router: SearchResultRouting?
  weak var listener: SearchResultListener?
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init(presenter: SearchResultPresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    // TODO: Implement business logic here.
  }
  
  override func willResignActive() {
    super.willResignActive()
    // TODO: Pause any business logic.
  }
}
