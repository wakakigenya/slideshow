//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 若木弦也 on 2021/02/06.
//  Copyright © 2021 genya.wakaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //outlet接続
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!

    
    
    //タイマー確認用変数
    var timer_sec: Float = 0
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0

    // スライドショーに使用するタイマーを宣言
    var timer: Timer!

    // スライドショーさせる画像の配列を宣言
    var imageArray = [
        "travel1",
        "travel2",
        "travel3"
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named:imageArray[nowIndex])
        

    }
    
    // 再生ボタンを押した時の処理
    @IBAction func slideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if self.timer == nil {
            // 再生時の処理を実装
            // タイマーをセットする
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            //他ボタンの使用不可
            nextButton.isEnabled = false
            backButton.isEnabled = false

        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil

            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
            //他ボタンの有効
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    //再生中に使用するメソッド指定
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if nowIndex == imageArray.count {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = UIImage(named:imageArray[nowIndex])
    }
    
    //進むボタンを押した時の処理
    @IBAction func onnext(_ sender: Any) {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if nowIndex == imageArray.count {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = UIImage(named:imageArray[nowIndex])
    }
    
    //戻るボタンを押した時の処理
    @IBAction func onback(_ sender: Any) {
        // indexを増やして表示する画像を切り替える
        nowIndex -= 1

        // indexが表示予定の画像の数と同じ場合
        if  nowIndex < 0 {
            nowIndex = 2
        }
        else if  nowIndex == imageArray.count  {
            nowIndex = 2
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = UIImage(named:imageArray[nowIndex])
    }
    
    //ここから画像を拡大するを質問する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               // segueから遷移先のResultViewControllerを取得する
               let resultViewController:ResultViewController = segue.destination as! ResultViewController
               // ここを修正している
               resultViewController.image = imageView.image
        
        
        }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
