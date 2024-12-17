//
//  TipsView.swift
//  Nearby
//
//  Created by Flávio Arêas on 17/12/24.
//

import UIKit

class TipsView: UIView {
    
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(icon: UIImage, title: String, description: String) {
        super.init(frame: .zero)
        
        configure(icon: icon, title: title, description: description)
    }
    
    private func configure(icon: UIImage, title: String, description: String) {
        iconImageView.image = icon
        titleLabel.text = title
        descriptionLabel.text = description
        
        configureUI()
    }
    
    private func configureUI() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        configureIcon()
        configureTitle()
        configureDescription()
    }
    
    private func configureIcon() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func configureTitle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func configureDescription() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
