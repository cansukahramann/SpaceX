//
//  LaunchDetailViewController.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 13.02.2024.
//

import UIKit
import Kingfisher
import SafariServices

final class LaunchDetailViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var image: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var pastView: UIView!
    @IBOutlet var pastDateLabel: UILabel!
    @IBOutlet var upcomingView: UIView!
    @IBOutlet var upcomingDateLabel: UILabel!
    @IBOutlet var hourLabel: UILabel!
    @IBOutlet var minuteLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    
    var viewModel: LauncDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: AttributesCell.identifer, bundle: nil), forCellWithReuseIdentifier: AttributesCell.identifer)
        tableView.register(UINib(nibName: MediaCell.identifier, bundle: nil ), forCellReuseIdentifier: MediaCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.delegate = self
        scrollView.isHidden = true
        
        upcomingView.layer.cornerRadius = 12
        viewModel.fetchDetail()
    }

}

extension LaunchDetailViewController: LaunchDetailViewModelDelegate {
    func populateViews(launch: LaunchModel) {
        image.kf.setImage(with: URL(string: launch.links.patch?.small ?? ""), placeholder: UIImage(named: "placeholder-image"))
        nameLabel.text = launch.name
        
        collectionView.reloadData()
        tableView.reloadData()
        
        if launch.upcoming == true {
            pastView.isHidden = true
            viewModel.startCoutdown()
        } else {
            upcomingView.isHidden = true
        }
        
        if let dateUnix = launch.dateUnix {
            upcomingDateLabel.text = dateUnix.unixToDate().dayMonthYear()
        } else {
            upcomingDateLabel.text = "-"
        }
        
        if let dateUnix = launch.dateUnix {
            pastDateLabel.text = dateUnix.unixToDate().dayMonthYear()
        } else {
            pastDateLabel.text = "-"
        }
        scrollView.isHidden = false
    }
    
    func updateCountdownLabels(hour: String, minute: String, second: String) {
        hourLabel.text = hour
        minuteLabel.text = minute
        secondLabel.text = second
    }
}

extension LaunchDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.launchDetails.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AttributesCell.identifer, for: indexPath) as! AttributesCell
        cell.configureCell(model: viewModel.launchDetails[indexPath.item])
        return cell
    }
}

extension LaunchDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = (collectionView.bounds.height - 20) / 3
        let width: CGFloat = (collectionView.bounds.width - 16) / 2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

extension LaunchDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.mediaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MediaCell.identifier, for: indexPath) as! MediaCell
        cell.configureCell(model: viewModel.mediaList[indexPath.row])
        return cell
    }
}

extension LaunchDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        66
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let urlString = viewModel.mediaList[indexPath.row].url , let url = URL(string: urlString) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC,animated: true)
        } else {
            let alertVC = UIAlertController(title: "", message: "This page cannot open!", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertVC, animated: true)
        }
    }
}
