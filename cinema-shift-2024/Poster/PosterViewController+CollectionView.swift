//
//  PosterViewController+CollectionView.swift
//  cinema-shift-2024
//
//  Created by Sergo on 03.02.2024.
//

import UIKit

extension PosterViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CinemaAPI.shared.films.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCustomCell", for: indexPath) as! PosterCustomCell
        cell.backgroundColor = .white
        cell.delegate = self
        let film = CinemaAPI.shared.films[indexPath.row]
        cell.configure(with: film)
        return cell
    }

}

extension PosterViewController:UICollectionViewDelegate {}
