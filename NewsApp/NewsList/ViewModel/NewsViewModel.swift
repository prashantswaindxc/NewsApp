//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Prashant Swain on 20/04/23.
//

import Foundation


class NewsViewModel{
    var newsResult = Bindable<[Article]>()
    var newsService:NewsServices
    
    init(service:NewsServices = NewsServices()){
        newsService = service
    }
    
    //MARK: Get Article from web services
    func getNewsArticles(){
        newsService.getNewsListApi { (news:NewsModel?, error) in
            self.newsResult.value =  news?.articles
          }
    }
}
