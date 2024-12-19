//
//  DetailVC.swift
//  Nearby
//
//  Created by Flávio Arêas on 19/12/24.
//

import UIKit

class DetailVC: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let coverImageView = UIImageView()
    let containerView = UIView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let infoTitleLabel = UILabel()
    let regulationTitleLabel = UILabel()
    let couponTitleLabel = UILabel()
    let infoStackView = UIStackView()
    let regulationLabel = UILabel()
    let couponStackView = UIStackView()
    let couponCodeLabel = UILabel()
    let qrCodeButton = UIButton(type: .system)
    let divider = UIView()
    let divider2 = UIView()
    let backButton = UIButton()
    
    var place : Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureDetails()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func configureUI() {
        view.addSubview(scrollView)
        view.addSubview(backButton)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(coverImageView)
        contentView.addSubview(containerView)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(infoTitleLabel)
        containerView.addSubview(infoStackView)
        containerView.addSubview(divider)
        containerView.addSubview(regulationTitleLabel)
        containerView.addSubview(regulationLabel)
        containerView.addSubview(divider2)
        containerView.addSubview(couponTitleLabel)
        containerView.addSubview(couponStackView)
        containerView.addSubview(qrCodeButton)
        
        couponStackView.addArrangedSubview(couponCodeLabel)
        infoStackView.axis = .vertical
        infoStackView.spacing = 8
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: infoStackView)
        
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: infoTitleLabel.bottomAnchor, constant: 12),
        ])
        
        configureScrollView()
        configureContentView()
        configureCoverImage()
        configureContainerView()
        configureTitleLabel()
        configureDescriptionLabel()
        configureInfoTitle()
        configureRegulationTitle()
        configureCouponTitle()
        configureCouponStackView()
        configureCouponCodeLabel()
        configureQRCodeButton()
        configureDivider()
        configureDivider2()
        configureBackButton()
    }
    
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureCoverImage() {
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.clipsToBounds = true
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: view.topAnchor),
            coverImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4),
            coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = Colors.gray100
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: -20),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    private func configureTitleLabel() {
        titleLabel.font = Typography.titleLG
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
        ])
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.font = Typography.textSM
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
    
    private func configureInfoTitle() {
        infoTitleLabel.font = Typography.textMD
        infoTitleLabel.textColor = Colors.gray500
        infoTitleLabel.text = "Informações"
        infoTitleLabel.numberOfLines = 0
        infoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 23),
            infoTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
        ])
    }
    
    private func configureRegulationTitle() {
        regulationTitleLabel.font = Typography.titleMD
        regulationTitleLabel.textColor = Colors.gray500
        regulationTitleLabel.numberOfLines = 0
        regulationTitleLabel.text = "Regulamento"
        regulationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            regulationTitleLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 16),
            regulationTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
        ])
    }
    
    private func configureRegulationLabel() {
        regulationLabel.font = Typography.titleSM
        regulationLabel.textColor = .darkGray
        regulationLabel.numberOfLines = 0
        regulationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: regulationLabel)
        
        NSLayoutConstraint.activate([
            regulationLabel.topAnchor.constraint(equalTo: regulationTitleLabel.bottomAnchor, constant: 12),
        ])
    }
    
    private func configureCouponTitle() {
        couponTitleLabel.font = Typography.titleMD
        couponTitleLabel.textColor = Colors.gray500
        couponTitleLabel.numberOfLines = 0
        couponTitleLabel.text = "Utilize esse cupom"
        couponTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            couponTitleLabel.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 16),
            couponTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
        ])
    }
    
    private func configureCouponStackView() {
        let iconImageView = UIImageView(image: UIImage(resource: .ticketIcon))
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = Colors.greenBase
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        couponStackView.addArrangedSubview(iconImageView)
        couponStackView.axis = .horizontal
        couponStackView.backgroundColor = Colors.greenLight
        couponStackView.layer.cornerRadius = 8
        couponStackView.spacing = 4
        couponStackView.alignment = .center
        couponStackView.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: couponStackView)
        
        NSLayoutConstraint.activate([
            couponStackView.topAnchor.constraint(equalTo: couponTitleLabel.bottomAnchor, constant: 12),
            couponStackView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func configureCouponCodeLabel() {
        couponCodeLabel.font = Typography.titleMD
        couponCodeLabel.textColor = Colors.gray600
        couponCodeLabel.textAlignment = .center
        couponCodeLabel.numberOfLines = 0
        qrCodeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureQRCodeButton() {
        qrCodeButton.setTitle("Ler QR Code", for: .normal)
        qrCodeButton.backgroundColor = Colors.greenBase
        qrCodeButton.titleLabel?.font = Typography.action
        qrCodeButton.setTitleColor(Colors.gray100, for: .normal)
        qrCodeButton.layer.cornerRadius = 8
        
        applyLateralConstraints(to: qrCodeButton)
        
        NSLayoutConstraint.activate([
            qrCodeButton.heightAnchor.constraint(equalToConstant: 44),
            qrCodeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -32),
        ])
    }
    
    private func configureDivider() {
        divider.backgroundColor = Colors.gray200
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: divider)
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 16),
            divider.heightAnchor.constraint(equalToConstant: 1),
        ])
        
    }
    
    private func configureDivider2() {
        divider2.backgroundColor = Colors.gray200
        divider2.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: divider2)
        
        NSLayoutConstraint.activate([
            divider2.topAnchor.constraint(equalTo: regulationLabel.bottomAnchor, constant: 16),
            divider2.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func configureBackButton() {
        backButton.backgroundColor = Colors.greenBase
        backButton.layer.cornerRadius = 12
        backButton.clipsToBounds = true
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        let arrowImage = UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysTemplate)
        let arrowImageView = UIImageView(image: arrowImage)
        arrowImageView.tintColor = Colors.gray100
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        backButton.addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            arrowImageView.centerXAnchor.constraint(equalTo: backButton.centerXAnchor),
            arrowImageView.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 20),
            arrowImageView.heightAnchor.constraint(equalToConstant: 20),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func applyLateralConstraints(to view: UIView) {
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
    }
    
    @objc private func didTapButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func configureDetails() {
        guard let place = place else {return}
        titleLabel.text = place.name
        descriptionLabel.text = place.description
        
        infoStackView.addArrangedSubview(createInfoRow(iconName: "ticketIcon", text: "\(place.coupons) cupons disponíveis"))
        infoStackView.addArrangedSubview(createInfoRow(iconName: "mapIcon", text: place.address))
        infoStackView.addArrangedSubview(createInfoRow(iconName: "phone", text: place.phone))
        
        regulationLabel.text = """
           * Válido apenas para consumo no local
           * Disponível até 31/12/2024
           """
        
        couponCodeLabel.text = place.id
        
        if let url = URL(string: place.cover) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Erro ao carregar imagem: \(error)")
                }
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.coverImageView.image = image
                    }
                }
                
            }.resume()
        }
    }
    
    private func createInfoRow(iconName: String, text: String) -> UIStackView {
        let iconImageView = UIImageView(image: UIImage(named: iconName))
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.tintColor = Colors.gray500
        iconImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = text
        label.font = Typography.textSM
        label.textColor = Colors.gray400
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, label])
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        return stackView
    }
}
