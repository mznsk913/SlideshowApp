//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by Saki Mizuno on 2023/10/24.
//

import UIKit

class NextViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    // 受け取るためのプロパティ（変数）を宣言しておく
    var image: UIImage?
    //let imageNameArray: [String] = ["totoro004", "totoro015", "totoro023"]
    //var imageNo = 0
    //どの画像の時にボタンを押したか
    //こらから書く一旦、代替
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 画像を設定
        imageView.image = image
    }
}
