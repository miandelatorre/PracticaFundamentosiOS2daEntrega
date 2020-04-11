//
//  FavoriteViewController.swift
//  AppOfThrones
//
//  Created by Miguel Angel de la Torre on 10/04/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    
    @IBOutlet weak var table: UITableView!
    
    
    var episodes = [Episode]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupData()
        table.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    // MARK: - Setup
    
    func setupUI() {
        self.title = "Favorites"
                
        let nib = UINib.init(nibName: "FavoriteTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "FavoriteTableViewCell")
    }
    
    
    func setupData() {
        
        episodes = [Episode]()
        
        for season in 1...8 {
        
            if let pathURL = Bundle.main.url(forResource: "season_\(season)", withExtension: "json") {
                do {
                    var episodes_json = [Episode]()
                    var episodes_json_filtered = [Episode]()
                    let data = try Data.init(contentsOf: pathURL)
                    let decoder = JSONDecoder()
                    episodes_json = try decoder.decode([Episode].self, from: data)
                    
                    episodes_json_filtered = episodes_json.filter({ (episode) -> Bool in
                        DataController.shared.isFavorite(episode)
                    })
                    
                    episodes.append(contentsOf: episodes_json_filtered)
                    
                    table.reloadData()
                } catch {
                    fatalError("Could not read the JSON")
                }
            } else {
                fatalError("Could not build the path url")
            }
         }

    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = episodes[indexPath.row]
        
        if let splitViewController = self.splitViewController,
            splitViewController.viewControllers.count > 1 {
            if let navigationController = splitViewController.viewControllers[1] as? UINavigationController,
                let detailViewController = navigationController.visibleViewController as? FavoriteDetailViewController {
                    detailViewController.episode = episode
            }
        } else {
            let favoriteDetailVC = FavoriteDetailViewController.init(episode: episode)
            self.navigationController?.pushViewController(favoriteDetailVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    // MARK: - UITableViewDatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = episodes[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath) as? FavoriteTableViewCell {
            cell.setEpisode(episode)

            return cell
        }
        fatalError("Could not create Account cells")
    }
    
}
