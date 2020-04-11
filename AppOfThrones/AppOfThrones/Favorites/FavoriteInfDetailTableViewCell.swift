//
//  FavoriteInfDetailTableViewCell.swift
//  AppOfThrones
//
//  Created by Miguel Angel de la Torre on 10/04/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class FavoriteInfDetailTableViewCell: UITableViewCell {

    private weak var episode: Episode?

    
    @IBOutlet weak var nameValue: UILabel!
    @IBOutlet weak var dateValue: UILabel!
    @IBOutlet weak var seasonValue: UILabel!
    @IBOutlet weak var episodeValue: UILabel!
    @IBOutlet weak var overviewValue: UILabel!
    
    // MARK: -Setter
    
    func setEpisode(_ episode: Episode) {
        self.episode = episode
        
        self.nameValue.text = episode.name
        self.dateValue.text = episode.date
        self.seasonValue.text = String(episode.season)
        self.episodeValue.text = String(episode.episode)
        self.overviewValue.text = episode.overview
                
    }
    

}
