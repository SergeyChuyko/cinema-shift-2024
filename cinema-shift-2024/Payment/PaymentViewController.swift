import UIKit

class PaymentViewController: UIViewController {

    private let nameFilmLabel: UILabel = {
        let label = UILabel()
        label.text = "Зеленая миля"
        label.font = UIFont.boldSystemFont(ofSize: 24)

        return label
    }()

    private let hallLabel: UILabel = {
        let label = UILabel()
        label.text = "Зал"
        label.textColor = UIColor(named: "text-color")
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private let hallNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Синий"
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()

    private let dateAndTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "text-color")
        label.text = "Дата и время"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private let currentDateAndTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "19 февраля 13:15"
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()

    private let seatLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "text-color")
        label.text = "Места"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private let currentSeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Не выбранно"
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()

    private let sumLabel: UILabel = {
        let label = UILabel()
        label.text = "Сумма:400 Р"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()

    private let buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "detailsButton-color")
        button.layer.cornerRadius = 20
        button.setTitle("Купить", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        title = "Оплата"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back-button"), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .always
    }

    private func setupUI() {
        view.addSubview(nameFilmLabel)
        view.addSubview(hallLabel)
        view.addSubview(hallNameLabel)
        view.addSubview(dateAndTimeLabel)
        view.addSubview(currentDateAndTimeLabel)
        view.addSubview(seatLabel)
        view.addSubview(sumLabel)
        view.addSubview(currentSeatLabel)
        view.addSubview(buyButton)

        nameFilmLabel.translatesAutoresizingMaskIntoConstraints = false
        hallLabel.translatesAutoresizingMaskIntoConstraints = false
        hallNameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateAndTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        currentDateAndTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        seatLabel.translatesAutoresizingMaskIntoConstraints = false
        sumLabel.translatesAutoresizingMaskIntoConstraints = false
        currentSeatLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameFilmLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            nameFilmLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameFilmLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            hallLabel.topAnchor.constraint(equalTo: nameFilmLabel.bottomAnchor, constant: 24),
            hallLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hallLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            hallNameLabel.topAnchor.constraint(equalTo: hallLabel.bottomAnchor, constant: 2),
            hallNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hallNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),


            dateAndTimeLabel.topAnchor.constraint(equalTo: hallNameLabel.bottomAnchor, constant: 24),
            dateAndTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dateAndTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            currentDateAndTimeLabel.topAnchor.constraint(equalTo: dateAndTimeLabel.bottomAnchor, constant: 2),
            currentDateAndTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            currentDateAndTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),


            seatLabel.topAnchor.constraint(equalTo: currentDateAndTimeLabel.bottomAnchor, constant: 24),
            seatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            seatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            currentSeatLabel.topAnchor.constraint(equalTo: seatLabel.bottomAnchor, constant: 2),
            currentSeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            currentSeatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            sumLabel.topAnchor.constraint(equalTo: currentSeatLabel.bottomAnchor, constant: 24),
            sumLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sumLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buyButton.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
}
