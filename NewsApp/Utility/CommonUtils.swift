//
//  CommonUtils.swift
//  NewsApp
//
//  Created by Prashant Swain on 21/04/23.
//

import Foundation
import UIKit

class CommonUtils {
    
    //MARK: Open Safari Browser
    static func openSafariBrowser(urlString:String?){
        guard let url = urlString else {return}
        guard let urlToOpen = URL(string: url) else{return}
        UIApplication.shared.open(urlToOpen)
    }
}
