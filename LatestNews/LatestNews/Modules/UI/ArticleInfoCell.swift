//
//  ArticleInfoCell.swift
//  LatestNews
//
//  Created by Sherif Nasr on 12/03/2021.
//

import UIKit

class ArticleInfoCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectionStyle = .none
        containerView.layer.cornerRadius = 15
        containerView.backgroundColor = .cellBg
    }
}


