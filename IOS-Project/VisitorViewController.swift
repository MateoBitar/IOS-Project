//
//  VisitorViewController.swift
//  IOS Assignment2
//
//  Created by Marco Bitar on 27/11/2024.
//  Copyright © 2024 Marco Bitar. All rights reserved.
//

import UIKit

class VisitorViewController: UIViewController {

    @IBOutlet weak var nbOfVisitors: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        var visitorCount = defaults.integer(forKey: "visitorCount") + 1
        defaults.set(visitorCount, forKey: "visitorCount")
        nbOfVisitors.text = "Visitors: \(visitorCount)"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
