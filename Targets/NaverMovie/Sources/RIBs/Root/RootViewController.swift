//
//  RootViewController.swift
//  NaverMovie
//
//  Created by Insu Byeon on 2021/12/05.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: AnyObject {
  // TODO: Declare properties and methods that the view controller can invoke to perform
  // business logic, such as signIn(). This protocol is implemented by the corresponding
  // interactor class.
  
  func presentToSearch()
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

  weak var listener: RootPresentableListener?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    print("Root RIB did load.")
    
    listener?.presentToSearch()
  }
  
  // MARK: - RootViewControllable
  func present(_ viewController: ViewControllable, animated: Bool) {
    viewController.uiviewController.modalPresentationStyle = .overFullScreen
    DispatchQueue.main.async {
      self.present(viewController.uiviewController, animated: animated, completion: nil)
    }
  }
}
