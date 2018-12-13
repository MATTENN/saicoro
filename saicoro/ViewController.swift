//
//  ViewController.swift
//  saicoro
//
//  Created by 友利 奈緒 on 2018/12/05.
//  Copyright © 2018年 MATTENN. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tapped(_ sender: Any) {
        
        if let swipeGestureRecognizer = sender as? UISwipeGestureRecognizer {
            switch swipeGestureRecognizer.direction {
            case .right:
                print("swipe right")
                swipeRight()
            case .left:
                print("swipe left")
                swipeLeft()
            case .up:
                print("swipe up")
                swipeUp()
            case .down:
                print("swipe down")
                swipeDown()
            default:
                break
            }
        } else {
            buttonTapped()
        }
    }
    
    func shake(){
        UIView.animate(withDuration: 1.0, animations: {
            self.place.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.place.alpha = 0.0
            self.subtitle.isHidden  = true
        },completion: {finished in
            self.place.transform = CGAffineTransform.identity
            self.place.alpha = 1.0
            self.subtitle.isHidden = false
            self.shuffle()
        })
    }
    
    func buttonTapped() {
        UIView.animate(withDuration: 1.0, animations: {
            self.place.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            self.place.alpha = 0.0
            self.subtitle.isHidden = true
        }, completion: { finished in
            self.place.transform = CGAffineTransform.identity
            self.place.alpha = 1.0
            self.subtitle.isHidden = false
            self.shuffle()
        })
    }
    
    func swipeRight(){
        UIView.animate(withDuration: 1.0, animations: {
            self.place.transform = CGAffineTransform(translationX: 200, y: 0)
            self.place.alpha = 0.0
            self.subtitle.isHidden = true
        },completion: {finished in
            self.place.transform = CGAffineTransform.identity
            self.place.alpha = 1.0
            self.subtitle.isHidden = false
            self.shuffle()
        })
    }
    
    func swipeLeft(){
        UIView.animate(withDuration: 1.0, animations: {
            self.place.transform = CGAffineTransform(translationX: -200, y: 0)
            self.place.alpha = 0.0
            self.subtitle.isHidden = true
        },completion: {finished in
            self.place.transform = CGAffineTransform.identity
            self.place.alpha = 1.0
            self.subtitle.isHidden = false
            self.shuffle()
        })
    }
    
    func swipeUp(){
        UIView.animate(withDuration: 1.0, animations: {
            self.place.transform = CGAffineTransform(translationX: 0, y: -200)
            self.place.alpha = 0.0
            self.subtitle.isHidden = true
        },completion: {finished in
            self.place.transform = CGAffineTransform.identity
            self.place.alpha = 1.0
            self.subtitle.isHidden = false
            self.shuffle()
        })
    }
    
    func swipeDown(){
        UIView.animate(withDuration: 1.0, animations: {
            self.place.transform = CGAffineTransform(translationX: 0, y: 200)
            self.place.alpha = 0.0
            self.subtitle.isHidden = true
        },completion: {finished in
            self.place.transform = CGAffineTransform.identity
            self.place.alpha = 1.0
            self.subtitle.isHidden = false
            self.shuffle()
        })
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("motionBegan")
        
        if event?.type == .motion && event?.subtype == .motionShake {
            shake()
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("motionEnded")
    }
    
    override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("motionCanceled")
    }
    
    func shuffle(){
        
        let url = Bundle.main.bundleURL.appendingPathComponent("sound.mp3")
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error!")
        }
        
        let 🎲 = arc4random_uniform(6)
        
        switch 🎲 {
        case 0:
            place.text = "博多"
            subtitle.text = "キングオブ深夜バス"
        case 1:
            place.text = "千歳"
            subtitle.text = "企画終了"
        case 2:
            place.text = "長野"
            subtitle.text = "善光寺でお参り"
        case 3:
            place.text = "信濃"
            subtitle.text = "今日も頼むぞ"
        case 4:
            place.text = "青森"
            subtitle.text = "北海道はすぐそこ"
        case 5:
            place.text = "高知"
            subtitle.text = "四国が呼んでる"
        default:
            place.text = "博多"
            subtitle.text = "キングオブ深夜バス"
        }
    }
    
}

