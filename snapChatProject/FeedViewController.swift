//
//  FeedViewController.swift
//  snapChatProject
//
//  Created by Gus Silva on 3/5/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var feedTable: UITableView!
    
    
    // TODO: Figure out how to use ImageFeed
    var threads: [String: [UIImage]] = ["Memes":[#imageLiteral(resourceName: "dankMeme1"), #imageLiteral(resourceName: "dankMeme2"), #imageLiteral(resourceName: "dankMeme3")], "Dog Spots": [#imageLiteral(resourceName: "cutePuppy"), #imageLiteral(resourceName: "anotherCutePuppy"), #imageLiteral(resourceName: "amazingCutePuppy")], "Random": [#imageLiteral(resourceName: "berkAtNight"), #imageLiteral(resourceName: "Campanile"), #imageLiteral(resourceName: "dirks")]]
    let threadNames = ["Memes", "Dog Spots", "Random"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.delegate = self
        feedTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threads.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let name = threadNames[section]
        return (threads[name]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTable.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedCell
        return cell
    }

}
