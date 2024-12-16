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
        self.view.backgroundColor = UIColor(red: 59/255, green: 155/255, blue: 98/255, alpha: 1)
        
        configureUI()
    }
    
    private func configureUI() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
