//
//  NewsTableView.swift
//  NewsApp
//
//  Created by Prashant Swain on 20/04/23.
//

import UIKit

class NewsTableView: UITableView {
    
    //MARK: Variables
    var data:[Article]?{
        didSet{
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    //MARK: Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetUp()
    }
    
    //MARK: Register CELL UINib and delegate
    private func initialSetUp(){
        let nib = UINib(nibName: "\(NewsTableViewCell.self)", bundle: nil)
        self.register(nib, forCellReuseIdentifier: "\(NewsTableViewCell.self)")
        self.delegate = self
        self.dataSource = self
    }

}

//MARK: TableView Delegate and DataSources
extension NewsTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsTableViewCell.self)", for: indexPath) as! NewsTableViewCell
        cell.configCellUI(data: data?[indexPath.row])
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let article = self.data?[indexPath.row] else {return}
        CommonUtils.openSafariBrowser(urlString: article.url)
    }
    
}
