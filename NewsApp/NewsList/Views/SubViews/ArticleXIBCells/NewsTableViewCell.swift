//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Prashant Swain on 20/04/23.


import UIKit

class NewsTableViewCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    
    //MARK: Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.articleImage.layer.cornerRadius = articleImage.frame.height/2
    }
    
    //MARK: Set Value in UI
    func configCellUI(data:Article?){
        guard let articleData = data else {return}
        labelTitle.text = (articleData.author?.isEmpty ?? true) ? "N/A" : articleData.author
        labelDescription.text = articleData.description
        labelTime.text = articleData.publishedAt.convertDateFormat(fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "dd/MM/yyyy hh:mm a")
        articleImage.downloadImageFromUrl(url: articleData.urlToImage ?? "")
    }
    
}
