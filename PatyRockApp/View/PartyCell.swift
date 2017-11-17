//
//  PartyCell.swift
//  PatyRockApp
//
//  Created by Mateus Marques on 03/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(partyRock: PartyRock) {
        viewTitle.text = partyRock.videTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
                
            } catch {
                print(error)
            }
        }
    }

}
