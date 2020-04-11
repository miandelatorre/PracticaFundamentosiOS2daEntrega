//
//  CastDetailViewController.swift
//  AppOfThrones
//
//  Created by Miguel Angel de la Torre on 01/03/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit


class CastDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CastImgDetailTableViewCellDelegate,
CastInfDetailTableViewCellDelegate {
    
    
    @IBOutlet weak var table: UITableView!
 
    var cast: Cast?

    convenience init(cast: Cast) {
        self.init(nibName: "CastDetailViewController", bundle: nil)
        self.setCast(cast)
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
        self.title = "Cast Details"
        
        let nibImg = UINib.init(nibName: "CastImgDetailTableViewCell", bundle: nil)
        table.register(nibImg, forCellReuseIdentifier: "CastImgDetailTableViewCell")
        
        let nibInf = UINib.init(nibName: "CastInfDetailTableViewCell", bundle: nil)
        table.register(nibInf, forCellReuseIdentifier: "CastInfDetailTableViewCell")
        
        self.table.dataSource = self
        self.table.delegate = self
    }
    
    func setCast(_ cast: Cast) {
        self.cast = cast

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
        let castCell = cast!
        
        if indexPath.row == 0 {
            if let cellImg = tableView.dequeueReusableCell(withIdentifier: "CastImgDetailTableViewCell", for: indexPath) as? CastImgDetailTableViewCell {
                cellImg.setCast(castCell)
                cellImg.delegate = self
                return cellImg
            }
        } else {
                if let cellInf = tableView.dequeueReusableCell(withIdentifier: "CastInfDetailTableViewCell", for: indexPath) as? CastInfDetailTableViewCell {
                    cellInf.setCast(castCell)
                    cellInf.delegate = self
                    return cellInf
            }
        }
        
        fatalError("Could not create Account cells")

    }
    
        
        
    
}

