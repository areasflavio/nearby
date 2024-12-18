//
//  PlaceTableViewCell.swift
//  Nearby
//
//  Created by Flávio Arêas on 18/12/24.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    static let identifier = "PlaceTableCell"
    
    let containerView = UIView()
    let itemImage = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let ticketIcon = UIImageView()
    let ticketLabel = UILabel()
    
    let padding: CGFloat = 8
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with place: Place) {
        if let url = URL(string: place.cover) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.itemImage.image = image
                    }
                }
            }.resume()
        }
        titleLabel.text = place.name
        descriptionLabel.text = place.description
        ticketLabel.text = "\(place.coupons) cupons disponíveis"
    }
    
    private func configureUI() {
        containerView.addSubview(itemImage)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(ticketIcon)
        containerView.addSubview(ticketLabel)
        addSubview(containerView)
        
        configureContainer()
        configureImage()
        configureTitle()
        configureDescription()
        configureTicketIcon()
        configureTicketLabel()
    }
    
    private func configureContainer() {
        containerView.layer.cornerRadius = 8
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = Colors.gray200.cgColor
        containerView.backgroundColor = Colors.gray100
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
        ])
    }
    
    private func configureImage() {
        itemImage.clipsToBounds = true
        itemImage.layer.cornerRadius = 8
        itemImage.contentMode = .scaleAspectFill
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            itemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            itemImage.widthAnchor.constraint(equalToConstant: 116),
            itemImage.heightAnchor.constraint(equalToConstant: 104)
        ])
    }
    
    private func configureTitle() {
        titleLabel.font = Typography.titleSM
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    private func configureDescription() {
        descriptionLabel.font = Typography.textXS
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = Colors.gray500
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    private func configureTicketIcon() {
        ticketIcon.image = UIImage(resource: .ticketIcon)
        ticketIcon.tintColor = Colors.redBase
        ticketIcon.contentMode = .scaleAspectFit
        ticketIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ticketIcon.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            ticketIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            ticketIcon.heightAnchor.constraint(equalToConstant: 14),
            ticketIcon.widthAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    private func configureTicketLabel() {
        ticketLabel.font = Typography.textXS
        ticketLabel.textColor = Colors.gray400
        ticketLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ticketLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            ticketLabel.centerYAnchor.constraint(equalTo: ticketIcon.centerYAnchor),
            ticketLabel.leadingAnchor.constraint(equalTo: ticketIcon.trailingAnchor, constant: 4),
            ticketLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor)
        ])
    }
}
