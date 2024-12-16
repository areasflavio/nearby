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
        let startViewController = NearbySplashVC(contentView: contentView)
        
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}
