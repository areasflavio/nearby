//
//  HomeVC.swift
//  Nearby
//
//  Created by Flávio Arêas on 18/12/24.
//

import UIKit

class HomeVC: UIViewController {
    
    var contentView: HomeView!
    
    init(contentView: HomeView) {
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
        view.backgroundColor = Colors.gray100
        
        configureContentViewToViewController(contentView: contentView)
    }
}
