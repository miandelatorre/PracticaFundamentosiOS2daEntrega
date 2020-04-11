//
//  FavoriteDetailViewController.swift
//  AppOfThrones
//
//  Created by Miguel Angel de la Torre on 10/04/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class FavoriteDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var episode: Episode?

    convenience init(episode: Episode) {
        self.init(nibName: "FavoriteDetailViewController", bundle: nil)
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
        
        let nibImg = UINib.init(nibName: "FavoriteImgDetailTableViewCell", bundle: nil)
        table.register(nibImg, forCellReuseIdentifier: "FavoriteImgDetailTableViewCell")
        
        let nibInf = UINib.init(nibName: "FavoriteInfDetailTableViewCell", bundle: nil)
        table.register(nibInf, forCellReuseIdentifier: "FavoriteInfDetailTableViewCell")
        
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
            if let cellImg = tableView.dequeueReusableCell(withIdentifier: "FavoriteImgDetailTableViewCell", for: indexPath) as? FavoriteImgDetailTableViewCell {
                cellImg.setEpisode(episodeCell)
                //cellImg.delegate = self
                return cellImg
            }
        } else {
                if let cellInf = tableView.dequeueReusableCell(withIdentifier: "FavoriteInfDetailTableViewCell", for: indexPath) as? FavoriteInfDetailTableViewCell {
                    cellInf.setEpisode(episodeCell)
                    //cellInf.delegate = self
                    return cellInf
            }
        }
        
        fatalError("Could not create Account cells")

    }
    
        
        
    
}
