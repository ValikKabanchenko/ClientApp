//
//  Model.swift
//  ClientApp
//
//  Created by Валик Кабанченко on 09.10.2022.
//

import Foundation


var article: [Article] {
   
        let data = try? Data(contentsOf: urlToData)
        if data == nil {
            return []
        }
        
        let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
        if rootDictionaryAny == nil {
            return []
        }
        
        let rootDictionary = rootDictionaryAny as? Dictionary<String,Any>
        if rootDictionary == nil {
            return []
        }
        
        if let array = rootDictionary!["articles"] as? [Dictionary<String,Any>] {
            var returnArray: [Article] = []
            
            for dict in array {
                let newArticle = Article(dictionary: dict)
                returnArray.append(newArticle)
            }
        
            return returnArray
        }
    return []
}

var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}
//https://newsapi.org/v2/everything?q=apple&from=2022-10-08&to=2022-10-08&sortBy=popularity&apiKey=8445507cd7604d3b8e79a4431a4630de

func loadNews(completionHandler: (()->Void)?){
    let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-10-08&to=2022-10-08&sortBy=popularity&apiKey=8445507cd7604d3b8e79a4431a4630de")
    let session = URLSession(configuration: .default)
    
    let dowlondTask = session.downloadTask(with: url!) { urlFile, respoce, error in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            print(urlToData)
            
            
            
            print(article.count)
            
            completionHandler?()
            
        }
    }
    dowlondTask.resume()
}

   

