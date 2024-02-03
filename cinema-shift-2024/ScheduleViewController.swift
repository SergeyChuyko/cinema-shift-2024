//
//  ScheduleViewController.swift
//  cinema-shift-2024
//
//  Created by Sergo on 03.02.2024.
//

import UIKit

class ScheduleViewController: UIViewController {

    private let dateSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Пн, 19 фев", "Вт, 20 фев", "Ср, 21 фев", "Чт, 22 фев", "Пт, 23 фев"])
        control.selectedSegmentTintColor = .gray

        return control
    }()

    private let redHallLabel: UILabel = {
        let label = UILabel()
        label.tintColor = UIColor(named: "description-color")
        label.text = "Красный зал"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private let redHallSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["11:40", "12:40", "13:40", "14:40"])
        control.selectedSegmentTintColor = .gray

        return control
    }()

    private let blueHallLabel: UILabel = {
        let label = UILabel()
        label.tintColor = UIColor(named: "description-color")
        label.text = "Синий зал"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private let blueHallSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["11:15", "12:15", "13:15"])
        control.selectedSegmentTintColor = .gray
        return control
    }()

    private let purpleHallLabel: UILabel = {
        let label = UILabel()
        label.tintColor = UIColor(named: "description-color")
        label.text = "Фиолетовый зал"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private let purpleHallSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["11:40", "12:40", "13:40", "14:40", "15:40"])
        control.selectedSegmentTintColor = .gray
        return control
    }()

    private let submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "detailsButton-color")
        button.layer.cornerRadius = 20
        button.setTitle("Подтвердить", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Расписание"
        setupUI()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back-button"), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .always
    }
    private func setupUI() {
        view.addSubview(dateSegmentedControl)
        view.addSubview(redHallLabel)
        view.addSubview(redHallSegmentedControl)
        view.addSubview(blueHallLabel)
        view.addSubview(blueHallSegmentedControl)
        view.addSubview(purpleHallLabel)
        view.addSubview(purpleHallSegmentedControl)
        view.addSubview(submitButton)

        dateSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        redHallLabel.translatesAutoresizingMaskIntoConstraints = false
        redHallSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        blueHallLabel.translatesAutoresizingMaskIntoConstraints = false
        blueHallSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        purpleHallLabel.translatesAutoresizingMaskIntoConstraints = false
        purpleHallSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dateSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            dateSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dateSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),


            redHallLabel.topAnchor.constraint(equalTo: dateSegmentedControl.bottomAnchor, constant: 24),
            redHallLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            redHallLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            redHallSegmentedControl.topAnchor.constraint(equalTo: redHallLabel.bottomAnchor, constant: 16),
            redHallSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            redHallSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),


            blueHallLabel.topAnchor.constraint(equalTo: redHallSegmentedControl.bottomAnchor, constant: 24),
            blueHallLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blueHallLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            blueHallSegmentedControl.topAnchor.constraint(equalTo: blueHallLabel.bottomAnchor, constant: 16),
            blueHallSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blueHallSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),


            purpleHallLabel.topAnchor.constraint(equalTo: blueHallSegmentedControl.bottomAnchor, constant: 24),
            purpleHallLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            purpleHallLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            purpleHallSegmentedControl.topAnchor.constraint(equalTo: purpleHallLabel.bottomAnchor, constant: 16),
            purpleHallSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            purpleHallSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            submitButton.heightAnchor.constraint(equalToConstant: 47)
        ])
    }

    @objc func nextButtonTapped() {

        let paymentVC = PaymentViewController()
        let navigationController = UINavigationController(rootViewController: paymentVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)

    }

    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
}
