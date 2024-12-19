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
        let startViewController = NearbySplashVC(contentView: contentView, delegate: self)
        
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

extension NearbyFlowCoordinator: SplashFlowDelegate {
    
    func decideNavigationFlow() {
        let welcomeVC = WelcomeVC(contentView: WelcomeView())
        welcomeVC.flowDelegate = self
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
}

extension NearbyFlowCoordinator: WelcomeFlowDelegate {
    
    func goToHome() {
        let homeVC = HomeVC()
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
