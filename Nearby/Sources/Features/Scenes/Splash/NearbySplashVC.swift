//
//  NearbySplashVC.swift
//  Nearby
//
//  Created by Flávio Arêas on 16/12/24.
//

import UIKit

class NearbySplashVC: UIViewController {
    
    var contentView: NearbySplashView!
    
    init(contentView: NearbySplashView) {
        super.init(nibName: nil, bundle: nil)
        self.contentView = contentView
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
        navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.greenLight
        
        configureUI()
    }
    
    private func configureUI() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
