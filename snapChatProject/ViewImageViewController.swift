//
//  ViewImageViewController.swift
//  snapChatProject
//
//  Created by Gus Silva on 3/5/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ViewImageViewController: UIViewController {

    var snapToView: Snap?
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let snap = snapToView {
            image.image = snap.image
            authorLabel.text = snap.author
            timeStampLabel.text = snap.getTimeStamp()
        }
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didPressImage(_ sender: Any) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.popViewController(animated: false)
//        performSegue(withIdentifier: "viewToFeed", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
