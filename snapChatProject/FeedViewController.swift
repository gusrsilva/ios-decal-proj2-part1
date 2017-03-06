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
    var snapToView: Snap?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.delegate = self
        feedTable.dataSource = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        feedTable.reloadData()
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
        
        let name = threadNames[indexPath.section]
        let snaps: [Snap] = threads[name]!
        let snap: Snap = snaps[indexPath.item]
        
        cell.nameLabel.text = snap.author
        cell.timeStampLabel.text = snap.getTimeStamp()
        if(snap.read) {
            cell.readStatusIndicator.image = #imageLiteral(resourceName: "read")
        }
        else {
            cell.readStatusIndicator.image = #imageLiteral(resourceName: "unread")
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // TODO: Mark as read using model
//        let cell = feedTable.cellForRow(at: indexPath) as! FeedCell
//        cell.readStatusIndicator.image = #imageLiteral(resourceName: "read")
        
        let name = threadNames[indexPath.section]
        let snaps: [Snap] = threads[name]!
        let snap: Snap = snaps[indexPath.item]
        snapToView = snap
        if(!snap.read) {
            snap.markAsRead()
            performSegue(withIdentifier: "feedToView", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "feedToView" {
                if let dest = segue.destination as? ViewImageViewController {
                    dest.snapToView = snapToView
                }
            }
        }
    }

}
