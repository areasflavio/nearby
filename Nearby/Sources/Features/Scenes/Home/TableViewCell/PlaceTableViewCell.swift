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
    
    private func configure(with place: Place) {
        itemImage.image = UIImage(named: place.imageName)
        titleLabel.text = place.title
        descriptionLabel.text = place.description
        ticketLabel.text = "\(place.tickets) cupons disponíveis"
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
            itemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            itemImage.widthAnchor.constraint(equalToConstant: 116),
            itemImage.heightAnchor.constraint(equalToConstant: 104)
        ])
    }
    
    private func configureTitle() {
        titleLabel.font = Typography.titleSM
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: itemImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    private func configureDescription() {
        descriptionLabel.font = Typography.textSM
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = Colors.gray300
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    private func configureTicketIcon() {
        ticketIcon.image = UIImage(resource: .ticketIcon)
        ticketIcon.tintColor = Colors.redBase
        ticketIcon.contentMode = .scaleAspectFit
        ticketIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ticketIcon.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: padding),
            ticketIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            ticketIcon.heightAnchor.constraint(equalToConstant: 14),
            ticketIcon.widthAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    private func configureTicketLabel() {
        ticketLabel.font = Typography.textXS
        ticketLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ticketLabel.centerYAnchor.constraint(equalTo: ticketIcon.centerYAnchor),
            ticketLabel.leadingAnchor.constraint(equalTo: ticketIcon.trailingAnchor, constant: 4),
            ticketLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
