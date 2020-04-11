//
//  CastImgDetailTableViewCell.swift
//  AppOfThrones
//
//  Created by Miguel Angel de la Torre on 01/03/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

protocol CastImgDetailTableViewCellDelegate: class {
    //func didFavoriteChanged()
}

class CastImgDetailTableViewCell: UITableViewCell {
    
    private weak var cast: Cast?
    weak var delegate: CastImgDetailTableViewCellDelegate?

    @IBOutlet weak var imageCast: UIImageView!

    
    override func awakeFromNib() {
        imageCast.layer.cornerRadius = 2.0
    }
    
    // MARK: -Setter
    
    func setCast(_ cast: Cast) {
        self.cast = cast
        imageCast.image = cast.avatar == nil ? nil : UIImage.init(named: cast.avatar!)
        
    }
}

