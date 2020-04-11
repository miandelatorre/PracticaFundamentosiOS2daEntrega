//
//  FavoriteImgDetaiTableViewCell.swift
//  AppOfThrones
//
//  Created by Miguel Angel de la Torre on 10/04/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class FavoriteImgDetailTableViewCell: UITableViewCell {

    private weak var episode: Episode?
    
    @IBOutlet weak var imageEpisode: UIImageView!
    
    
    override func awakeFromNib() {
        imageEpisode.layer.cornerRadius = 2.0
    }
    
    // MARK: -Setter
    
    func setEpisode(_ episode: Episode) {
        self.episode = episode
        imageEpisode.image = episode.image == nil ? nil : UIImage.init(named: episode.image!)
        
    }

}
