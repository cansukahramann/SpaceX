//
//  LauncDetailViewModel.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 20.02.2024.
//

import Foundation

protocol LaunchDetailViewModelDelegate: AnyObject {
    func populateViews(launch: LaunchModel)
    func updateCountdownLabels(hour: String, minute: String, second: String)
}

final class LauncDetailViewModel {
    
    weak var delegate: LaunchDetailViewModelDelegate?
    
    var LaunchID: String!
    private let service = DetailService()
    
    var launchDetails: [LaunchDetail] = []
    var mediaList: [LaunchMedia] = []
    
    private var timer: Timer!
    private var dateUnix: Double = 0
    
    func fetchDetail() {
        service.getDetail(id: LaunchID) { [weak self] result in
            switch result {
            case .success(let launch):
                self?.dateUnix = launch.dateUnix ?? 0
                self?.launchDetails = launch.launchDetails
                self?.mediaList = launch.mediaList
                self?.delegate?.populateViews(launch: launch)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension LauncDetailViewModel {
    func startCoutdown() {
        setCountdownValues()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.dateUnix -= 1
            self.setCountdownValues()
        }
    }
    
    private func setCountdownValues() {
        let date = dateUnix.unixToDate()
        let hour = date.getComponentValue(.hour)
        let minute = date.getComponentValue(.minute)
        let second = date.getComponentValue(.second)
        
        delegate?.updateCountdownLabels(hour: hour, minute: minute, second: second)
    }
}
