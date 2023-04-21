//
//  ImageDownload.swift
//  NewsApp
//
//  Created by Prashant Swain on 20/04/23.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString,AnyObject>()


extension UIImageView{
    public func downloadImageFromUrl(url:String?){
        guard let imageURL = url else{return}
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.frame = self.bounds
        activityIndicator.startAnimating()
        if self.image == nil{
            self.addSubview(activityIndicator)
        }
        
//MARK: Check Image in Cache
        if let cacheImage = imageCache.object(forKey: imageURL.replacingOccurrences(of: " ", with: "%20") as NSString){
            if let image = cacheImage as? UIImage{
                activityIndicator.removeFromSuperview()
                self.image = image
                print("Find Image in Cache for Key:",imageURL.replacingOccurrences(of: " ", with: "%20"))
                return
            }
        }
       print("Connecting to host with URL: \(imageURL)")
        guard let imageurl = URL(string: imageURL) else {return}
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageurl){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        activityIndicator.removeFromSuperview()
                        self.image = image
                    }
                    imageCache.setObject(image, forKey: imageURL.replacingOccurrences(of: " ", with: "%20") as NSString)
                   }
                
            }
        }
        
    }
}
