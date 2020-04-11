//
//  FavoriteTableViewCell.swift
//  AppOfThrones
//
//  Created by Miguel Angel de la Torre on 10/04/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {


    private weak var episode: Episode?
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        thumb.layer.cornerRadius = 2.0
        thumb.layer.borderColor  = UIColor.white.withAlphaComponent(0.2).cgColor
        thumb.layer.borderWidth  = 1.0
    }

    // MARK: - Setter
    
    func setEpisode(_ episode: Episode) {
        self.episode = episode
        thumb.image = episode.image == nil ? nil : UIImage.init(named: episode.image!)
        title.text  = episode.name
        date.text   = episode.date
    }

}
