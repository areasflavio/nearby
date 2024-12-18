//
//  FlowCoordinator.swift
//  Nearby
//
//  Created by Flávio Arêas on 16/12/24.
//

import UIKit

class NearbyFlowCoordinator {
    
    private var navigationController: UINavigationController?
    
    init() { }
    
    func configure() -> UINavigationController? {
        let contentView = NearbySplashView()
//        let startViewController = NearbySplashVC(contentView: contentView, delegate: self)
        let startViewController = HomeVC()
        
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

extension NearbyFlowCoordinator: SplashFlowDelegate {
    
    func decideNavigationFlow() {
        let contentView = WelcomeView()
        let welcomeViewController = WelcomeVC(contentView: contentView)
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
