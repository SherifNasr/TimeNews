//
//  ArticlesInfoViewModelTests.swift
//  LatestNewsTests
//
//  Created by Sherif Nasr on 13/03/2021.
//

import Quick
import Nimble

@testable import LatestNews

class ArticlesInfoViewModelTests: QuickSpec {

    override func spec() {
        describe("test ArticlesInfoViewModel") {
            let viewModel = ArticlesListViewModel()
            context("After fetching articles list successfully") {
                beforeEach {
                    if let jsonData = TestHelper().loadStubDataFromBundle(name: "ViewedArticlesMock", extension: "json") {
                        let response = try? JSONDecoder().decode(ArticlesListResponse.self, from: jsonData)
                        viewModel.articlesInfo = response?.results
                    }
                }

                it("returns correct articlesInfo") {
                    expect(viewModel.articlesInfo).notTo(beNil())
                    expect(viewModel.articlesInfo?.count).to(be(20))
                    expect(viewModel.articlesInfo?.first?.url).notTo(be(""))
                    expect(viewModel.articlesInfo?[1].publishedDate == "2021-03-06").to(be(true))
                }
                
                it("test functions") {
                    expect(viewModel.getNumberOfArticles() == viewModel.articlesInfo?.count).to(be(true))
                    expect(viewModel.articleTitle(at: 2) == viewModel.articlesInfo?[2].title).to(be(true))
                    expect(viewModel.articleURL(at: 5)?.absoluteString == viewModel.articlesInfo?[5].url).to(be(true))
                }
                
            }
        }
    }
}

