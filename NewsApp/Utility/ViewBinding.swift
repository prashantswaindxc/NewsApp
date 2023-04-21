//
//  ViewBinding.swift
//  NewsApp
//
//  Created by Prashant Swain on 20/04/23.
//

import Foundation

class Bindable<T> {
    
    typealias Observer = ((T?) -> ())
    
    final var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    final var observer: Observer?
    
    final func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
    
}
