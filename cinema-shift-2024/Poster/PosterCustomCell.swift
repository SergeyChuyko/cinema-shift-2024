//
//  PostelCustomCell.swift
//  cinema-shift-2024
//
//  Created by Sergo on 02.02.2024.
//

import UIKit

protocol PosterCustomCellDelegate: AnyObject {
    func detailsButtonTapped(in cell: PosterCustomCell)
}

class PosterCustomCell: UICollectionViewCell {
    weak var delegate: PosterCustomCellDelegate?
    var film: Films? 
    let starsArray = ["⭐","⭐","⭐","⭐","⭐","⭐","⭐","⭐","⭐","⭐"]
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "topView-color")
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner]
        return view
    }()

    let posterImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true 
        image.layer.cornerRadius = 10
        return image
    }()

    let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center

        return label
    }()
    let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .lightGray
        return label
    }()
    let raitingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    let platformRaitingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .lightGray
        return label
    }()
    let textView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    let detailsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "detailsButton-color")
        button.layer.cornerRadius = 20
        button.setTitle("Подробнее", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(detailsButtonTapped), for: .touchUpInside)
        return button
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(topView)
        contentView.addSubview(typeLabel)
        contentView.addSubview(countryLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(raitingLabel)
        contentView.addSubview(platformRaitingLabel)
        contentView.addSubview(detailsButton)
    }
    private func setupConstraints() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        topView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        raitingLabel.translatesAutoresizingMaskIntoConstraints = false
        platformRaitingLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 285),

            topView.heightAnchor.constraint(equalTo: posterImageView.heightAnchor, multiplier: 1/5),
            topView.widthAnchor.constraint(equalTo: posterImageView.widthAnchor, multiplier: 1/3),
            topView.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor),

            typeLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 8),
            typeLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16),
            typeLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16),
            typeLabel.heightAnchor.constraint(equalToConstant: 14),

            countryLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 4),
            countryLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16),
            countryLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16),
            countryLabel.heightAnchor.constraint(equalToConstant: 14),

            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 20),

            raitingLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            raitingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            raitingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            raitingLabel.heightAnchor.constraint(equalToConstant: 48),

            platformRaitingLabel.topAnchor.constraint(equalTo: raitingLabel.bottomAnchor, constant: 4),
            platformRaitingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            platformRaitingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            platformRaitingLabel.heightAnchor.constraint(equalToConstant: 20),

            detailsButton.topAnchor.constraint(equalTo: platformRaitingLabel.bottomAnchor, constant: 16),
            detailsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            detailsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            detailsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
    }

    func configure(with film: Films) {
        let randomCount = Int.random(in: 1...10)

        let randomStars = Array(starsArray.prefix(randomCount))
        let randomStarsString = randomStars.joined()
        typeLabel.text = film.genres.first
        countryLabel.text = film.country.name
        titleLabel.text = film.name
        subtitleLabel.text = (film.releaseDate == "-") ? "Неизвестно" : film.releaseDate
        raitingLabel.text = randomStarsString
        platformRaitingLabel.text = "Kinopoisk - \(film.userRatings.kinopoisk)"
        textView.text = film.description
        ImageLoader.shared.loadImage(from: film.img) { [weak self] image in
            self?.posterImageView.image = image ?? UIImage(named: "placeholderImage")
        }
    }

    @objc func detailsButtonTapped() {
        delegate?.detailsButtonTapped(in: self)
    }
}

