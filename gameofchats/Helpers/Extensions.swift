//
//  Extensions.swift
//  gameofchats
//
//  Created by John Ryan on 8/7/17.
//  Copyright © 2017 John Ryan. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(urlString: String) {
        
        self.image = nil
        
        
        //check cache for cached image 1st
        
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            
            self.image = cachedImage
            return
        }
        
        //otherwise fire off new donload
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            //print("profileImageUrl is \(profileImageUrl)")
            //print("data is \(String(describing: data))")
            
            if error != nil {
                print(error as Any)
                return
            }
            
            
            DispatchQueue.main.async {
                
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    
                    self.image = downloadedImage
                }
                
                
                
            }
            
        }).resume()
    }
    
}
