//
//  MediaCell.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 20.02.2024.
//

import UIKit

class MediaCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var iconImage: UIImageView!
    
    static let identifier: String = String(describing: MediaCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 16
    }

    func configureCell(model: LaunchMedia) {
        nameLabel.text = model.title
        iconImage.image = UIImage(systemName: model.systemName)
    }
    
}
