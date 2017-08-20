//
//  Message.swift
//  gameofchats
//
//  Created by John Ryan on 8/11/17.
//  Copyright © 2017 John Ryan. All rights reserved.
//

import UIKit
import Firebase

class Message: NSObject {
    
    var fromId: String?
    var text: String?
    var timeStamp: NSNumber?
    var toId: String?

    func chatPartnerId() -> String? {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
}

