//
//  ConfirmPostViewController.swift
//  snapChatProject
//
//  Created by Gus Silva on 3/5/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ConfirmPostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var feedsTableView: UITableView!
    
    var imageToPost: UIImage?
    
    // TODO: Figure out how to use ImageFeed to get this
    let threadNames = ["Memes", "Dog Spots", "Random"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedsTableView.delegate = self
        feedsTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedsTableView.dequeueReusableCell(withIdentifier: "feedPickerCell", for: indexPath) as! FeedPickerCell
        cell.feedName.text = threadNames[indexPath.item]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}
