//
//  SearchResultViewController.swift
//  NaverMovie
//
//  Created by Insu Byeon on 2021/12/13.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol SearchResultPresentableListener: AnyObject {
  // TODO: Declare properties and methods that the view controller can invoke to perform
  // business logic, such as signIn(). This protocol is implemented by the corresponding
  // interactor class.
}

final class SearchResultViewController: UIViewController, SearchResultPresentable, SearchResultViewControllable {
  
  weak var listener: SearchResultPresentableListener?
}
