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
        containerView.addSubview(couponStackView)
        containerView.addSubview(regulationTitleLabel)
        containerView.addSubview(regulationLabel)
        containerView.addSubview(divider)
        containerView.addSubview(infoStackView)
        containerView.addSubview(infoTitleLabel)
        containerView.addSubview(divider2)
        containerView.addSubview(qrCodeButton)
        
        configureScrollView()
        configureContentView()
        configureCoverImage()
        configureContainerView()
        configureTitleLabel()
        configureDescriptionLabel()
        configureCouponStackView()
        configureCouponTitle()
        configureCouponCodeLabel()
        configureRegulationTitle()
        configureRegulationLabel()
        configureDivider()
        configureInfoStackView()
        configureInfoTitle()
        configureDivider2()
        configureQRCodeButton()
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
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: -20),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureTitleLabel() {
        titleLabel.font = Typography.titleLG
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
        ])
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.font = Typography.textSM
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
        ])
    }
    
    private func configureCouponStackView() {
        let iconImageView = UIImageView(image: UIImage(resource: .ticketIcon))
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = Colors.redBase
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        couponStackView.addArrangedSubview(iconImageView)
        couponStackView.addArrangedSubview(couponTitleLabel)
        couponStackView.addArrangedSubview(couponCodeLabel)
        couponStackView.axis = .horizontal
        couponStackView.backgroundColor = Colors.redLight
        couponStackView.layer.cornerRadius = 8
        couponStackView.spacing = 4
        couponStackView.alignment = .center
        couponStackView.distribution = .fill
        couponStackView.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        couponStackView.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: couponStackView)
        
        NSLayoutConstraint.activate([
            couponStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            couponStackView.heightAnchor.constraint(equalToConstant: 40),
            
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func configureCouponTitle() {
        couponTitleLabel.font = Typography.titleMD
        couponTitleLabel.textColor = Colors.gray600
        couponTitleLabel.numberOfLines = 0
        couponTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCouponCodeLabel() {
        couponCodeLabel.font = Typography.textMD
        couponCodeLabel.textColor = Colors.gray500
        couponCodeLabel.textAlignment = .center
        couponCodeLabel.numberOfLines = 0
        couponCodeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureRegulationTitle() {
        regulationTitleLabel.font = Typography.titleMD
        regulationTitleLabel.textColor = Colors.gray500
        regulationTitleLabel.numberOfLines = 0
        regulationTitleLabel.text = "Regulamento"
        regulationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            regulationTitleLabel.topAnchor.constraint(equalTo: couponStackView.bottomAnchor, constant: 32),
            regulationTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
        ])
    }
    
    private func configureRegulationLabel() {
        regulationLabel.font = Typography.textSM
        regulationLabel.textColor = Colors.gray400
        regulationLabel.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        
        let regulationText = """
                • Válido apenas para consumo no local
                • Disponível até 31/12/2024
                """
        
        let attributedText = NSAttributedString(
            string: regulationText,
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: Typography.textSM,
                .foregroundColor: Colors.gray500
            ]
        )
        
        regulationLabel.attributedText = attributedText
        regulationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            regulationLabel.topAnchor.constraint(equalTo: regulationTitleLabel.bottomAnchor, constant: 8),
            regulationLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
        ])
    }
   
    private func configureDivider() {
        divider.backgroundColor = Colors.gray200
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: divider)
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: regulationLabel.bottomAnchor, constant: 16),
            divider.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func configureInfoTitle() {
        infoTitleLabel.font = Typography.textMD
        infoTitleLabel.textColor = Colors.gray500
        infoTitleLabel.text = "Informações"
        infoTitleLabel.numberOfLines = 0
        infoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoTitleLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 16),
            infoTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
        ])
    }
    
    private func configureInfoStackView() {
        infoStackView.axis = .vertical
        infoStackView.spacing = 8
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: infoStackView)
        
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: infoTitleLabel.bottomAnchor, constant: 8),
        ])
    }
    
    private func configureDivider2() {
        divider2.backgroundColor = Colors.gray200
        divider2.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: divider2)
        
        NSLayoutConstraint.activate([
            divider2.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 16),
            divider2.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func configureQRCodeButton() {
        qrCodeButton.setTitle("Ler QR Code", for: .normal)
        qrCodeButton.backgroundColor = Colors.greenBase
        qrCodeButton.titleLabel?.font = Typography.action
        qrCodeButton.setTitleColor(Colors.gray100, for: .normal)
        qrCodeButton.layer.cornerRadius = 8
        qrCodeButton.translatesAutoresizingMaskIntoConstraints = false
        
        applyLateralConstraints(to: qrCodeButton)
        
        NSLayoutConstraint.activate([
            qrCodeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -32),
            qrCodeButton.heightAnchor.constraint(equalToConstant: 44),
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
            view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
        ])
    }
    
    @objc private func didTapButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func configureDetails() {
        guard let place else { return }
        
        titleLabel.text = place.name
        descriptionLabel.text = place.description
        
        couponTitleLabel.text = "\(place.coupons)"
        couponCodeLabel.text = "cupons disponíveis"

        infoStackView.addArrangedSubview(createInfoRow(iconName: "mapIcon", text: place.address))
        infoStackView.addArrangedSubview(createInfoRow(iconName: "phone", text: place.phone))
        
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
