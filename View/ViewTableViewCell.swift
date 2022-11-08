//
//  ViewTableViewCell.swift
//  ClientApp
//
//  Created by Валик Кабанченко on 08.11.2022.
//

import UIKit

class ViewTableViewCell: UITableViewCell {

    @IBOutlet weak var imageVi: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelSubject: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    func loadCellData(_ article: Article) {
        if article.urlToImage != "" {
            if let imageURL:URL = URL(string: article.urlToImage) {
                imageVi!.downloaded(from: imageURL)
            }
        }
        
        labelTitle.text = article.title
        labelSubject.text =  article.publishedAt
    
    }


}
