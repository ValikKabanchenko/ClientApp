//
//  Model.swift
//  ClientApp
//
//  Created by Валик Кабанченко on 09.10.2022.
//

import Foundation


var article: [Article] = []
//https://newsapi.org/v2/everything?q=apple&from=2022-10-08&to=2022-10-08&sortBy=popularity&apiKey=8445507cd7604d3b8e79a4431a4630de

func loadNews(){
    let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-10-08&to=2022-10-08&sortBy=popularity&apiKey=8445507cd7604d3b8e79a4431a4630de")
    let session = URLSession(configuration: .default)
    let dowlondTask = session.downloadTask(with: url!) { urlFile, respoce, error in
        if urlFile != nil {
            let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
            let urlPath = URL(fileURLWithPath: path)
              try? FileManager.default.copyItem(at: urlFile!, to: urlPath)
            print(urlPath)
            
            parseNews()
            print(article.count)
        }
    }
    dowlondTask.resume()
}
func parseNews(){
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    
    let data = try? Data(contentsOf: urlPath)
    let rootDictionary = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as!
    Dictionary<String,Any>
    
    let array = rootDictionary!["articles"] as! [Dictionary<String,Any>]
    
    var returnArray: [Article] = []
    for dict in array {
        let newArticle = Article(dictionary: dict)
        returnArray.append(newArticle)
    }
    article = returnArray
}
