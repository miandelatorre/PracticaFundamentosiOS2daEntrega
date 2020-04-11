//
//  EpisodeTableInfDetailViewCell.swift
//  AppOfThrones
//
//  Created by Miguel Angel de la Torre on 01/03/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit


protocol EpisodeInfDetailTableViewCellDelegate: class {
    
}

class EpisodeInfDetailTableViewCell: UITableViewCell {
    
    private weak var episode: Episode?
    weak var delegate: EpisodeInfDetailTableViewCellDelegate?
    
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

