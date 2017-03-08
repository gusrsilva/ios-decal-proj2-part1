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
    
    @IBOutlet weak var selectedFeed: UILabel!
    var imageToPost: UIImage?
    var currentFeed: String?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedsTableView.delegate = self
        feedsTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backItem?.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        currentFeed = threadNames[indexPath.item]
        selectedFeed.text = currentFeed
        
    }
    
    @IBAction func didPressPostButton(_ sender: UIButton) {
        // TODO: Handle posting to the selected feed
        if let thread = currentFeed {
            var snaps: [Snap] = threads[thread]!
            // TODO: Update personWhoPosted
            snaps.append(Snap(imageToPost: imageToPost!, personWhoPosted: "Gustavo"))
            threads[thread] = snaps
            showPostSuccessAlert(thread)
        }
        else {
            showNoThreadSelectedAlert()
        }
    }
    
    func showNoThreadSelectedAlert() -> Void {
        let alertTitle = "Whoops!"
        let alertMessage = "You haven't selected a thread to post to."
        
        let alert: UIAlertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            default:
                return
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showPostSuccessAlert(_ thread: String) -> Void {
        let alertTitle = "Success!"
        let alertMessage = "Your photo was posted to \(thread)."
        
        let alert: UIAlertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            default:
                self.navigationController?.popViewController(animated: true)
                return
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
