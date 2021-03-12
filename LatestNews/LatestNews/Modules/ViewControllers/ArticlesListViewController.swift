//
//  ArticlesListViewController.swift
//  LatestNews
//
//  Created by Sherif Nasr on 12/03/2021.
//

import UIKit
import Combine

class ArticlesListViewController: UIViewController {

    @IBOutlet weak var articlesTableView: UITableView!
    
    let viewModel = ArticlesListViewModel()
    private var disposeBag = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        viewModel.fetchLastWeekNews()
    }

    private func bindData(){
        viewModel.$articlesInfo
            .receive(on: DispatchQueue.main).sink {[unowned self] (articles) in
                articlesTableView.reloadData()
            }.store(in: &disposeBag)
    }

}

extension ArticlesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfArticles()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleInfoCell") as! ArticleInfoCell
        cell.titleLabel.text = viewModel.articleTitle(at: indexPath.row)
        cell.dateLabel.text = viewModel.articlePublishDate(at: indexPath.row)
        return cell
    }
    
}

extension ArticlesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
