//
//  ArticlesListViewModel.swift
//  LatestNews
//
//  Created by Sherif Nasr on 12/03/2021.
//

import Foundation
import Combine

class ArticlesListViewModel: ObservableObject {
   @Published var articlesInfo: [ArticleInfoModel]?
    
    func fetchLastWeekNews(){
        RequestManager.beginRequest(with: ArticlesProvider.viewedArticles(days: 7),
                                    responseModel: ArticlesListResponse.self) { (articlesInfo, error) in
            if let articlesInfo = (articlesInfo as? ArticlesListResponse)?.results {
                self.articlesInfo = articlesInfo
            }
        }
    }
    
    func getNumberOfArticles() -> Int {
        return articlesInfo?.count ?? 0
    }
    
    func article(at index: Int) -> ArticleInfoModel? {
        guard let articles = articlesInfo,
              index < articles.count,
              let article = articlesInfo?[index] else {
            return nil
        }
        return article
    }
    
    func articleTitle(at index: Int) -> String {
        guard let article = article(at: index) else {return ""}
        return article.title
    }
    
    func articlePublishDate(at index: Int) -> String {
        guard let article = article(at: index) else {return ""}
        return article.publishedDate
    }
    
    func articleURL(at index: Int) -> URL? {
        guard let article = article(at: index) else {return nil}
        return URL(string:  article.url)
    }
    
}
