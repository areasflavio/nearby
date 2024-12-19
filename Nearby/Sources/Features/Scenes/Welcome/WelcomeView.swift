//
//  WelcomeView.swift
//  Nearby
//
//  Created by Flávio Arêas on 17/12/24.
//

import UIKit

class WelcomeView: UIView {
    
    var didTapButton: (() -> Void?)?
    
    let logoImageView = UIImageView()
    let welcomeLabel = UILabel()
    let descriptionLabel = UILabel()
    let subTextForTips = UILabel()
    let tipsStackView = UIStackView()
    let button = UIButton()
    
    let padding: CGFloat = 24

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(subTextForTips)
        addSubview(tipsStackView)
        addSubview(button)
        
        configureImage()
        configureLabel()
        configureDescription()
        configureSubText()
        configureStack()
        configureTips()
        configureButton()
    }
    
    private func configureImage() {
        logoImageView.image = UIImage(resource: .logoIcon)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func configureLabel() {
        welcomeLabel.text = "Boas vindas ao Nearby"
        welcomeLabel.font = Typography.titleXL
        welcomeLabel.numberOfLines = 0
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: padding),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func configureDescription() {
        descriptionLabel.text = "Tenha cupons de vantagem para user em seus estabelecimentos favoritos."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = Typography.textMD
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 64),
        ])
    }
    
    private func configureSubText() {
        subTextForTips.text = "Veja como funciona:"
        subTextForTips.numberOfLines = 0
        subTextForTips.font = Typography.textMD
        subTextForTips.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subTextForTips.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: padding),
            subTextForTips.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            subTextForTips.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            subTextForTips.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func configureStack() {
        tipsStackView.spacing = 24
        tipsStackView.axis = .vertical
        tipsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tipsStackView.topAnchor.constraint(equalTo: subTextForTips.bottomAnchor, constant: padding),
            tipsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            tipsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
        ])
    }
    
    private func configureTips() {
        let tip1 = TipsView(icon: UIImage(resource: .mapIcon), title: "Encontre estabelecimentos", description: "Veja locais perto de você que são parceiros Nearby")
        let tip2 = TipsView(icon: UIImage(resource: .qrcodeIcon), title: "Ative o cupom com QR Code", description: "Escaneia o código no estabelecimento para usar o benefício")
        let tip3 = TipsView(icon: UIImage(resource: .ticketIcon), title: "Garanta vantagens perto de você", description: "Ative cupons onde estiver, em diferentes tipos de estabelecimento")
        
        tipsStackView.addArrangedSubview(tip1)
        tipsStackView.addArrangedSubview(tip2)
        tipsStackView.addArrangedSubview(tip3)
    }
    
    private func configureButton() {
        button.setTitle("Começar", for: .normal)
        button.backgroundColor = Colors.greenBase
        button.setTitleColor(Colors.gray100, for: .normal)
        button.titleLabel?.font = Typography.action
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            button.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
    @objc private func didTap() {
        didTapButton?()
    }
}
