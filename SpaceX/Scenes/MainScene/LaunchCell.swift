//
//  LaunchCell.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 6.02.2024.
//

import UIKit
import Kingfisher

class LaunchCell: UICollectionViewCell {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let identifer = String(describing: LaunchCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 12.0
    }
    
    func configure(launch: LaunchModel) {
        imageView.kf.setImage(with: URL(string: launch.links.patch?.small ?? ""), placeholder: UIImage(named:"placeholder-image"))
        
        nameLabel.text = launch.name
        if let dateUnix = launch.dateUnix {
            dateLabel.text = dateUnix.unixToDate().dayMonthYear()
        } else {
            dateLabel.text = ""
        }
    }
    
}
