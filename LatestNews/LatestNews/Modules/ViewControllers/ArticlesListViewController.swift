//
//  ArticlesListViewController.swift
//  LatestNews
//
//  Created by Sherif Nasr on 12/03/2021.
//

import UIKit
import Combine
import SafariServices
import MBProgressHUD

class ArticlesListViewController: UIViewController {

    @IBOutlet weak var articlesTableView: UITableView!
    
    let viewModel = ArticlesListViewModel()
    private var disposeBag = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        fetchData()
        title = "Most Viewed Articles"
    }

    private func bindData(){
        viewModel.$articlesInfo
            .receive(on: DispatchQueue.main).sink {[unowned self] (articles) in
                MBProgressHUD.hide(for: view, animated: true)
                self.articlesTableView.reloadData()
            }.store(in: &disposeBag)
    }
    
    private func fetchData(){
        MBProgressHUD.showAdded(to: view, animated: true)
        viewModel.fetchLastWeekNews()
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
        guard let url = viewModel.articleURL(at: indexPath.row) else {return}
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
}

extension ArticlesListViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
