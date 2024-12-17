//
//  WelcomeView.swift
//  Nearby
//
//  Created by Flávio Arêas on 17/12/24.
//

import UIKit

class WelcomeView: UIView {
    
    let logoImageView = UIImageView()
    let welcomeLabel = UILabel()
    let descriptionLabel = UILabel()
    let tipsStackView = UIStackView()
    let button = UIButton()

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
        addSubview(tipsStackView)
        
        configureImage()
        configureLabel()
        configureDescription()
        configureStack()
        configureButton()
    }
    
    private func configureImage() {
        logoImageView.image = UIImage(resource: .logoIcon)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func configureLabel() {
        welcomeLabel.text = "Boas vindas ao Nearby"
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func configureDescription() {
        descriptionLabel.text = "Tenha cupons de vantagem para user em seus estabelecimentos favoritos."
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func configureStack() {
        tipsStackView.spacing = 16
        tipsStackView.axis = .vertical
        tipsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tipsStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            tipsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            tipsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            tipsStackView.bottomAnchor.constraint(equalTo: button.topAnchor),
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
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8 ),
            button.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
