//
//  NewsModel.swift
//  NewsApp
//
//  Created by Prashant Swain on 20/04/23.
//

import Foundation

//MARK: News Model
struct NewsModel:Codable{
    let status:String
    let totalResults:Int
    let articles:[Article]
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(String.self, forKey: .status)
        self.totalResults = try container.decode(Int.self, forKey: .totalResults)
        self.articles = try container.decode([Article].self, forKey: .articles)
    }
}

//MARK: Article Model
struct Article:Codable{
    let source:Source
    let author:String?
    let title,description:String
    let url:String
    let urlToImage:String?
    let publishedAt:String
    let content:String
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decode(Source.self, forKey: .source)
        self.author = try container.decodeIfPresent(String.self, forKey: .author)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.url = try container.decode(String.self, forKey: .url)
        self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        self.publishedAt = try container.decode(String.self, forKey: .publishedAt)
        self.content = try container.decode(String.self, forKey: .content)
    }
}

//MARK: Source Model
struct Source:Codable{
    let id:String?
    let name:String
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}
