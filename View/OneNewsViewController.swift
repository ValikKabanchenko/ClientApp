//
//  OneNewsViewController.swift
//  ClientApp
//
//  Created by Валик Кабанченко on 22.10.2022.
//

import UIKit
import SafariServices
class OneNewsViewController: UIViewController , SFSafariViewControllerDelegate{

    
    var index: Int = 0
    var article:Article!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
   
    @IBOutlet weak var viesSeeMore: UIButton!
    
    
    @IBAction func pushOpenSafari(_ sender: Any) {
        
        if let url = URL(string: article.url) {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viesSeeMore.titleLabel!.numberOfLines = 1
        viesSeeMore.titleLabel!.adjustsFontSizeToFitWidth = true
        viesSeeMore.titleLabel!.lineBreakMode = .byClipping
        
        labelTitle.text = article.title
        labelDescription.text = article.description
        
        DispatchQueue.main.async {
            
            if let url = URL(string: self.article.urlToImage){
                if let data = try? Data(contentsOf: url){
                    self.imageView.image = UIImage(data: data)
                }
                
            }
           
        }
       
    }
       
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
