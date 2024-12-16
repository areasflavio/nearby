//
//  FlowCoordinator.swift
//  Nearby
//
//  Created by Flávio Arêas on 16/12/24.
//

import UIKit

class FlowCoordinator {
    
    private var navigationController: UINavigationController?
    
    init() {
    }
    
    func configure() -> UINavigationController? {
        let startViewController = UIViewController()
        startViewController.view.backgroundColor = .systemPink
        
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}
