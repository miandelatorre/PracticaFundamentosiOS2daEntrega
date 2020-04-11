//
//  CastInfDetailTableViewCell.swift
//  AppOfThrones
//
//  Created by Miguel Angel de la Torre on 01/03/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit


protocol CastInfDetailTableViewCellDelegate: class {
    
}

class CastInfDetailTableViewCell: UITableViewCell {
    
    private weak var cast: Cast?
    weak var delegate: CastInfDetailTableViewCellDelegate?
    
    @IBOutlet weak var nameValue: UILabel!
    
    @IBOutlet weak var roleValue: UILabel!

    @IBOutlet weak var episodeValue: UILabel!
    
    @IBOutlet weak var dateValue: UILabel!

    @IBOutlet weak var placeOfBirthValue: UILabel!

    
    
    // MARK: -Setter
    
    func setCast(_ cast: Cast) {
        self.cast = cast
        
        self.nameValue.text = cast.fullname
        self.roleValue.text = cast.role
        self.episodeValue.text = String(cast.episodes!)
        self.dateValue.text = cast.birth
        self.placeOfBirthValue.text = cast.placeBirth
                
    }
    
}

