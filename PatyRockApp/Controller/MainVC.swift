//
//  ViewController.swift
//  PatyRockApp
//
//  Created by Mateus Marques on 03/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlVideoTest = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8?start=50\" frameborder=\"0\" allowfullscreen></iframe>"
        let urlImageTest = "https://i.ytimg.com/vi/KQ6zr6kCPj8/maxresdefault.jpg"
        
        let p1 = PartyRock(imageURL: urlImageTest, videoURL: urlVideoTest, videoTitle: "The party Title")
        
        partyRocks.append(p1)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

}

