//
//  EpisodeDetailViewController.swift
//  AppOfThrones
//
//  Created by Fernando Torcelly Garcia on 10/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EpisodeImgDetailTableViewCellDelegate,
EpisodeInfDetailTableViewCellDelegate {
    
    
    @IBOutlet weak var table: UITableView!
 
    var episode: Episode?

    convenience init(episode: Episode) {
        self.init(nibName: "EpisodeDetailViewController", bundle: nil)
        self.setEpisode(episode)
    }
    
    // MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        table.reloadData()
    }
    
    // MARK: -Setup
    
    func setUI() {
        self.title = "Episode Details"
        
        let nibImg = UINib.init(nibName: "EpisodeImgDetailTableViewCell", bundle: nil)
        table.register(nibImg, forCellReuseIdentifier: "EpisodeImgDetailTableViewCell")
        
        let nibInf = UINib.init(nibName: "EpisodeInfDetailTableViewCell", bundle: nil)
        table.register(nibInf, forCellReuseIdentifier: "EpisodeInfDetailTableViewCell")
        
        self.table.dataSource = self
        self.table.delegate = self
    }
    
    func setEpisode(_ episode: Episode) {
        self.episode = episode

    }

    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 390
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDatasource
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episodeCell = episode!
        
        if indexPath.row == 0 {
            if let cellImg = tableView.dequeueReusableCell(withIdentifier: "EpisodeImgDetailTableViewCell", for: indexPath) as? EpisodeImgDetailTableViewCell {
                cellImg.setEpisode(episodeCell)
                cellImg.delegate = self
                return cellImg
            }
        } else {            
                if let cellInf = tableView.dequeueReusableCell(withIdentifier: "EpisodeInfDetailTableViewCell", for: indexPath) as? EpisodeInfDetailTableViewCell {
                    cellInf.setEpisode(episodeCell)
                    cellInf.delegate = self
                    return cellInf
            }
        }
        
        fatalError("Could not create Account cells")

    }
    
        
        
    
}
