//
//  String.swift
//  NewsApp
//
//  Created by Prashant Swain on 20/04/23.
//

import Foundation
import UIKit


extension String{
    
    //MARK: Convert DateString form one to another method
     func convertDateFormat(fromFormat:String, toFormat:String) ->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        let date = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateFormat = toFormat
        return dateFormatter.string(from: date)
    }
}
