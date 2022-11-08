//
//  LaunchScreenViewController.swift
//  ClientApp
//
//  Created by Валик Кабанченко on 07.11.2022.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var readNewsButtonView: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//       ||Dynamic Button title||
        readNewsButtonView.titleLabel!.numberOfLines = 1
        readNewsButtonView.titleLabel!.adjustsFontSizeToFitWidth = true
        readNewsButtonView.titleLabel!.lineBreakMode = .byClipping
        
       
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
