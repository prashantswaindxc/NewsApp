//
//  ViewController.swift
//  NewsApp
//
//  Created by Prashant Swain on 20/04/23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlet
    @IBOutlet weak var newsTableView: NewsTableView!
    
    //MARK: Variable
    let viewModel = NewsViewModel()
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModelBindingObserver()
        viewModel.getNewsArticles()
        }

    //MARK: Method For Observer Buinding
    func setupViewModelBindingObserver(){
        viewModel.newsResult.bind{ [weak self] (newsArticleArray) in
            self?.newsTableView.data = newsArticleArray
        }
    }

}

