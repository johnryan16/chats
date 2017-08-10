//
//  File.swift
//  gameofchats
//
//  Created by John Ryan on 8/9/17.
//  Copyright © 2017 John Ryan. All rights reserved.
//

import Foundation
import UIKit


let titleView = UIView()
titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
titleView.backgroundColor = UIColor.blue
print("Titleview = \(titleView)")

let containerView = UIView()
containerView.translatesAutoresizingMaskIntoConstraints = false
titleView.addSubview(containerView)

let profileImageView = UIImageView()
profileImageView.translatesAutoresizingMaskIntoConstraints = false
profileImageView.contentMode = .scaleAspectFill
profileImageView.layer.cornerRadius = 20
profileImageView.clipsToBounds = true

if let profileImageUrl = user.profileImageUrl {
    profileImageView.loadImageUsingCacheWithUrlString(urlString: profileImageUrl)
}

containerView.addSubview(profileImageView)

//need x,y,width,height anchors
profileImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
profileImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true

let nameLabel = UILabel()

containerView.addSubview(nameLabel)
nameLabel.text = user.name
nameLabel.translatesAutoresizingMaskIntoConstraints = false

nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
nameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
nameLabel.heightAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true

containerView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
containerView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true


