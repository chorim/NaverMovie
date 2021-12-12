//
//  SearchViewController.swift
//  NaverMovie
//
//  Created by Insu Byeon on 2021/12/05.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol SearchPresentableListener: AnyObject {
  // TODO: Declare properties and methods that the view controller can invoke to perform
  // business logic, such as signIn(). This protocol is implemented by the corresponding
  // interactor class.
}

final class SearchViewController: UIViewController, SearchPresentable, SearchViewControllable {
  
  weak var listener: SearchPresentableListener?
  private var searchController: UISearchController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "NAVER Movie"
  }
  
  // MARK: - SearchPresentable
  func setupViews(_ searchResultViewControllable: SearchResultViewControllable) {
    searchController = UISearchController(searchResultsController: searchResultViewControllable.uiviewController)
    searchController?.searchBar.placeholder = "Search movies"
    //        searchController?.searchBar.delegate = self
    searchController?.automaticallyShowsCancelButton = true
    searchController?.obscuresBackgroundDuringPresentation = false
    searchController?.hidesNavigationBarDuringPresentation = true
    
    navigationItem.hidesSearchBarWhenScrolling = false
    navigationItem.searchController = searchController
    navigationController?.navigationBar.sizeToFit()
  }
}
