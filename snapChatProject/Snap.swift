//
//  Snap.swift
//  snapChatProject
//
//  Created by Gus Silva on 3/6/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit


class Snap {
    
    var image: UIImage?
    var author: String = "Unknown"
    var datePosted: Date = Date.init()
    var read: Bool = false
    
    init(imageToPost image: UIImage, personWhoPosted author: String) {
        self.image = image
        self.author = author
        self.datePosted = Date.init()
        self.read = false
    }
    
    
    func markAsRead() -> Void {
        self.read = true
    }
    
    func getTimeStamp() -> String {
        let timeInterval: Double = -self.datePosted.timeIntervalSinceNow
        let minutes: Int = Int(round(timeInterval) / 60)
        let hours: Int = minutes / 60
        let days: Int = hours / 24
        let weeks: Int = days / 7
        if(minutes < 60) {
            return "\(minutes) minutes ago"
        }
        else if(hours < 24) {
            return "\(hours) hours ago"
        }
        else if(days < 7) {
            return "\(days) days ago"
        }
        else {
            return "\(weeks) weeks ago"
        }
    }

    
}
