//
//  PageViewControlerViewController.swift
//  ClientApp
//
//  Created by Валик Кабанченко on 22.10.2022.
//

import UIKit

class PageViewControlerViewController: UIPageViewController , UIPageViewControllerDataSource{
    
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        showViewControllers()
        loadNews {
            self.showViewControllers()
        }
        
        
    }
    
    func showViewControllers(){
        DispatchQueue.main.async {
            if let vc = self.pageViewController(for: 0) {
                self.setViewControllers([vc ], direction: .forward, animated: false, completion: nil)
            }
        }
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? OneNewsViewController)?.index ?? 0) - 1
        
        return self.pageViewController(for: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? OneNewsViewController)?.index ?? 0) + 1
        
        return self.pageViewController(for: index)
    }
    
    
    func pageViewController(for index: Int) -> OneNewsViewController? {
        if index < 0 {
            return nil
        }
        
        if index >= article.count{
            return nil
        }
        let vc =  (storyboard?.instantiateViewController(withIdentifier: "oneNewsSID") as! OneNewsViewController)
        vc.article = article[index]
        vc.index = index
        return vc
    }


}
