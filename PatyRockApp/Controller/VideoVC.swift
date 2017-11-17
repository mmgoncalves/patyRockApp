//
//  VideoVC.swift
//  PatyRockApp
//
//  Created by Mateus Marques on 03/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock {
        get {
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = partyRock.videTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
