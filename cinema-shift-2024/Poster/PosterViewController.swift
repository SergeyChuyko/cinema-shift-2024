//
//  PosterViewController.swift
//  cinema-shift-2024
//
//  Created by Sergo on 02.02.2024.
//

import UIKit

class PosterViewController: UIViewController {
    var films: [Films] = []

    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Афиша"
        view.backgroundColor = .white
        setupUI()
        colletcionSettings()
        fetchCinemaData()
    }

    func setupUI() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 16
        let totalSpacing = spacing * 2
        let availableWidth = view.bounds.width - totalSpacing
        layout.itemSize = CGSize(width: availableWidth, height: 500)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = 32

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(PosterCustomCell.self, forCellWithReuseIdentifier: "PosterCustomCell")
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
    }


    func colletcionSettings() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func fetchCinemaData() {

        CinemaAPI.shared.fetchTodayCinemaData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let posterModel):
                    self?.films = posterModel.films
                    self?.collectionView.reloadData()
                case .failure(_): break
                }
            }
        }


    }
}


extension PosterViewController: PosterCustomCellDelegate {

    func detailsButtonTapped(in cell: PosterCustomCell) {
        guard let poster = cell.posterImageView.image,
              let filmName = cell.titleLabel.text,
              let date = cell.typeLabel.text,
              let country = cell.countryLabel.text,
              let subTitle = cell.subtitleLabel.text,
              let raiting = cell.raitingLabel.text,
              let platformRaiting = cell.platformRaitingLabel.text,
              let aboutFilm = cell.textView.text else {
            return
        }
        let aboutCinemaVC = AboutCinemaViewController(
            poster: poster,
            filmName: filmName,
            date: date,
            country: country,
            subTitle: subTitle,
            raiting: raiting,
            platformRaiting: platformRaiting,
            aboutFilm: aboutFilm
        )
        aboutCinemaVC.modalPresentationStyle = .fullScreen
        self.present(aboutCinemaVC, animated: true, completion: nil)
    }

}
