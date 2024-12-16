//
//  NearbySplashView.swift
//  Nearby
//
//  Created by Flávio Arêas on 16/12/24.
//

import UIKit

class NearbySplashView: UIView {
    
    var logoImageView = UIImageView()
    var backgroundImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.addSubview(logoImageView)
        self.addSubview(backgroundImageView)
        
        configureLogoImageView()
        configureBackgroundImageView()
    }
    
    private func configureLogoImageView() {
        logoImageView.image = UIImage(resource: .logo)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func configureBackgroundImageView() {
        backgroundImageView.image = UIImage(resource: .background)
        backgroundImageView.contentMode = .scaleAspectFit
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
    }
}
