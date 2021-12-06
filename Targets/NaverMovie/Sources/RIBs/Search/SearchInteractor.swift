//
//  SearchInteractor.swift
//  NaverMovie
//
//  Created by Insu Byeon on 2021/12/05.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import RIBs
import RxSwift

protocol SearchRouting: ViewableRouting {
  // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SearchPresentable: Presentable {
  var listener: SearchPresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
  func setupViews()
}

protocol SearchListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SearchInteractor: PresentableInteractor<SearchPresentable>, SearchInteractable, SearchPresentableListener {
  
  weak var router: SearchRouting?
  weak var listener: SearchListener?
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init(presenter: SearchPresentable) {
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
