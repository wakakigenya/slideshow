//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 若木弦也 on 2021/02/27.
//  Copyright © 2021 genya.wakaki. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultimageView: UIImageView!

    //変数宣言
    var image: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultimageView.image = image
        // Do any additional setup after loading the view.
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
