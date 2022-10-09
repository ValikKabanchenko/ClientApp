//
//  Article.swift
//  ClientApp
//
//  Created by Валик Кабанченко on 09.10.2022.
//

import Foundation

/*
 {
 -"source": {
 "id": "wired",
 "name": "Wired"
 },
 "author": "Louryn Strampe",
 "title": "18 Best Early Amazon Prime Day Deals (2022): Echo Devices, Phones, and TVs",
 "description": "The Prime Early Access Sale runs on October 11 and 12, but the discounts have already started.",
 "url": "https://www.wired.com/story/best-early-amazon-prime-day-deals-access-sale-2022-1/",
 "urlToImage": "https://media.wired.com/photos/60c0fbe641e613255aec1672/191:100/w_1280,c_limit/Gear-Amazon-Fire-HD-10-Review.jpg",
 "publishedAt": "2022-10-08T11:00:00Z",
 "content": "Back in 2015, Amazon made waves with its first annual Prime Day shopping event. You cant just make up a shopping holiday! folks cried, and yet the sale took off, statistically outperforming Black Fri… [+9450 chars]"
 }
 
 
 */
struct Article{
    var aurthor: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sourceName: String
    
    init(dictionary: Dictionary<String, Any>){
    aurthor = dictionary["aurthor"] as? String ?? " "
    title = dictionary["title"] as? String ?? " "
    description = dictionary["description"] as? String ?? " "
    url = dictionary["url"] as? String ?? " "
    urlToImage = dictionary["urlToImage"] as? String ?? " "
    publishedAt = dictionary["publishedAt"] as? String ?? " "
    
    sourceName = (dictionary["source "] as? Dictionary<String,Any> ?? [" " : " "])["name"] as? String ?? " "
    
    }
    
}
