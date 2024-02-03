//
//  AboutCinemaViewController.swift
//  cinema-shift-2024
//
//  Created by Sergo on 02.02.2024.
//

import UIKit

class AboutCinemaViewController: UIViewController {
    let multiplier = 0.55/500
    var film: Films?
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancelButton-image"), for: .normal)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    let posterImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "topView-color")
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner]
        return view
    }()
    let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.text = "Фантастика"
        label.textAlignment = .center

        return label
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.text = "США, 2023"
        label.textAlignment = .center
        return label
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.text = "Title"
        return label
    }()
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .lightGray
        label.text = "Subtitle"
        return label
    }()
    let raitingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemYellow
        return label
    }()
    let platformRaitingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .lightGray
        label.text = "Kinopoisk - 8.4"
        return label
    }()
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = UIColor(named: "description-color")
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.showsVerticalScrollIndicator = false
        return textView
    }()
    let timeTableButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "detailsButton-color")
        button.layer.cornerRadius = 20
        button.setTitle("Посмотреть расписание", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    init(poster: UIImage,
         filmName: String,
         date: String,
         country: String,
         subTitle: String,
         raiting: String,
         platformRaiting: String,
         aboutFilm: String
    ) {
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = filmName
        typeLabel.text = date
        dateLabel.text = country
        subtitleLabel.text = subTitle
        raitingLabel.text = raiting
        platformRaitingLabel.text = platformRaiting
        descriptionTextView.text = aboutFilm
        posterImageView.image = poster
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "О фильме"
        setupUI()
        setupConstraints()
    
    }
    private func setupUI() {
        view.addSubview(closeButton)
        view.addSubview(posterImageView)
        view.addSubview(topView)
        view.addSubview(typeLabel)
        view.addSubview(dateLabel)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(raitingLabel)
        view.addSubview(platformRaitingLabel)
        view.addSubview(descriptionTextView)
        view.addSubview(timeTableButton)
    }
    private func setupConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        topView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        raitingLabel.translatesAutoresizingMaskIntoConstraints = false
        platformRaitingLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        timeTableButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),

            posterImageView.topAnchor.constraint(equalTo: closeButton.bottomAnchor,constant: 34),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            posterImageView.heightAnchor.constraint(equalToConstant: 300),

            topView.heightAnchor.constraint(equalTo: posterImageView.heightAnchor, multiplier: 1/5),
            topView.widthAnchor.constraint(equalTo: posterImageView.widthAnchor, multiplier: 1/3),
            topView.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor),

            typeLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 8),
            typeLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16),
            typeLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16),
            typeLabel.heightAnchor.constraint(equalToConstant: 14),

            dateLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16),
            dateLabel.heightAnchor.constraint(equalToConstant: 14),

            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 20),

            raitingLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            raitingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            raitingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            raitingLabel.heightAnchor.constraint(equalToConstant: 48),

            platformRaitingLabel.topAnchor.constraint(equalTo: raitingLabel.bottomAnchor, constant: 4),
            platformRaitingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            platformRaitingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            platformRaitingLabel.heightAnchor.constraint(equalToConstant: 20),

            descriptionTextView.topAnchor.constraint(equalTo: platformRaitingLabel.bottomAnchor, constant: 24),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            timeTableButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 24),
            timeTableButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timeTableButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            timeTableButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            timeTableButton.heightAnchor.constraint(equalToConstant: 47)
        ])
    }

    func configure() {

    }

    @objc func buttonTapped() {
        let scheduleVC = ScheduleViewController()
        let navigationController = UINavigationController(rootViewController: scheduleVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }


    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
}
