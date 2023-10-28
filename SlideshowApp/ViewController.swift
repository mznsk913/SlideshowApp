//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Saki Mizuno on 2023/10/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var move: UIButton!
    @IBOutlet weak var Return: UIButton!
    @IBOutlet weak var StartStop: UIButton!
    
    //画像配列
    let imageNameArray: [String] = ["totoro004", "totoro015", "totoro023"]
    var imageNo = 0
    
    //メソットに入れる
    //let count = imageNameArray.count

    // タイマー
    var timer: Timer!
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 画像を設定
                let sampleImage = UIImage(named: imageNameArray[imageNo])
                imageView.image = sampleImage
    }
    

    
    //進むボタン
    @IBAction func moveBotton(_ sender: Any) {
        if imageNo == 2{
            imageNo = 0
        }else{
            imageNo += 1
        }
        imageView.image = UIImage(named: imageNameArray[imageNo])
    }
    //戻るボタン
    @IBAction func ReturnButton(_ sender: Any) {
        if imageNo == 0{
            imageNo = 2
        }else{
            imageNo -= 1
        }
        imageView.image = UIImage(named: imageNameArray[imageNo])
    }
    //スライドで最後の画像の時１番最初に戻る
    @objc func updateTimer(_ timer: Timer) {
        //画像を次の画像に1つ進ませてimageに表示する
        if imageNo == 2{
            imageNo = 0
        }else{
            imageNo += 1
        }
        imageView.image = UIImage(named: imageNameArray[imageNo])
    }
    //スライド再生/停止
    @IBAction func StartStopButton(_ sender: Any) {
        //再生
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            //ボタンを停止に変更
            StartStop.setTitle("停止", for: .normal)
            //進む、戻るを無効化
            move.isEnabled = false
            Return.isEnabled = false
        }
        // // タイマーの作成、始動
        //        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        //停止
        else {
            // タイマーを停止する
            self.timer.invalidate()
            // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            self.timer = nil
            //ボタンを再生に変更
            StartStop.setTitle("再生", for: .normal)
            //進む、戻るを無効化
            move.isEnabled = true
            Return.isEnabled = true
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if self.timer != nil {
            // タイマーを停止する
            self.timer.invalidate()
            // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            self.timer = nil
            //ボタンを再生に変更
            StartStop.setTitle("再生", for: .normal)
            //進む、戻るを無効化
            move.isEnabled = true
            Return.isEnabled = true
        }
        // segueから遷移先のResultViewControllerを取得する
        let NextViewController:NextViewController = segue.destination as! NextViewController
        // 遷移先ので宣言しているimageに値を代入して渡す
        NextViewController.image = UIImage(named: imageNameArray[imageNo])
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}

