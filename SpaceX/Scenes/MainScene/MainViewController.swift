//
//  MainViewController.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 13.02.2024.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    private let viewModel = MainViewModel()
    
    lazy var segmentedControl: UISegmentedControl = {
       let items = ["Upcoming", "Past"]
       let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedChanged), for: .valueChanged)
        let width: CGFloat = navigationController?.navigationBar.frame.width ?? segmentedControl.frame.width
        segmentedControl.frame.size.width = width
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = segmentedControl
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: LaunchCell.identifer, bundle: nil), forCellWithReuseIdentifier: LaunchCell.identifer)
        
        viewModel.delegate = self
        viewModel.fetchLaunch(by: .upcoming)
    }
    
    @objc
    private func segmentedChanged() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            viewModel.fetchLaunch(by: .upcoming)
        case 1:
            viewModel.fetchLaunch(by: .past)
        default:
            break
        }
    }
}

extension MainViewController: MainViewModelDelegate {
    func prepareUpdateUI() {
        collectionView.reloadData()
        collectionView.setContentOffset(.zero, animated: false)
    }
    func updateUI() {
        collectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.launches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchCell.identifer, for: indexPath) as! LaunchCell
        let launch = viewModel.launches[indexPath.row]
        cell.configure(launch: launch)
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width - 32, height: 104)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedLaunch = viewModel.launches[indexPath.item]
        
        let launchDetailViewModel = LauncDetailViewModel()
        launchDetailViewModel.LaunchID = selectedLaunch.id
        
        let launchDetailViewController = LaunchDetailViewController()
        launchDetailViewController.viewModel = launchDetailViewModel
        
        navigationController?.pushViewController(launchDetailViewController, animated: true)
    }
}
