//
//  AttributesCell.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 20.02.2024.
//

import UIKit

class AttributesCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    static let identifer: String = String(describing: AttributesCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 16
    }
    
    func configureCell(model: LaunchDetail) {
        titleLabel.text = model.title
        valueLabel.text = model.value
    }

}
