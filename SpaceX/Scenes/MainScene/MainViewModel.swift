//
//  MainViewModel.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 6.02.2024.
//

import Foundation

protocol MainViewModelDelegate: AnyObject {
    func prepareUpdateUI() 
    func updateUI()
}

final class MainViewModel {
    
    weak var delegate: MainViewModelDelegate?
    private let service = LaunchService()
    
    var launches: [LaunchModel] = []
    
    func fetchLaunch(by kind: Kind) {
        launches.removeAll()
        
        service.getLaunch(kind: kind) { [weak self] result in
            switch result {
            case .success(let model):
                self?.launches = model
                self?.delegate?.updateUI()
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
