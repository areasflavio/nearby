//
//  WelcomeVC.swift
//  Nearby
//
//  Created by Flávio Arêas on 17/12/24.
//

import UIKit

class WelcomeVC: UIViewController {
    
    var contentView: WelcomeView!
    weak var flowDelegate: WelcomeFlowDelegate?
    
    init(contentView: WelcomeView) {
        super.init(nibName: nil, bundle: nil)
        self.contentView = contentView
        
        contentView.didTapButton = { [weak self] in
            guard let self else { return }
            
            self.flowDelegate?.goToHome()            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        view.addSubview(contentView)
        view.backgroundColor = Colors.gray100
        
        configureContentViewToViewController(contentView: contentView)
    }
}
