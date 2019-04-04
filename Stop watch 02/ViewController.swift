//
//  ViewController.swift
//  Stop watch 02
//
//  Created by dit08 on 2019. 4. 4..
//  Copyright © 2019년 dit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    var time = 0

    //Timer 객체 생성
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(time)
    }
    
    @IBAction func startBtnPressed(_ sender: Any) {
    
        myTimer = Timer.scheduledTimer(timeInterval:0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        ChangeButtonState(start: false, pause: true, stop: true)
    }
    @IBAction func pauseBtnPressed(_ sender: Any) {
        //Timer가 정기 재개 가능
        myTimer.invalidate()
        ChangeButtonState(start: true, pause: false, stop: true)
    }
    @IBAction func resetBtnPressed(_ sender: Any) {
        myTimer.invalidate()
        time = 0
        timeLabel.text = String(time)
        ChangeButtonState(start: true, pause: false, stop: false)
    }
    
    @objc func updateTime(){
        time+=1
        let min = time / 6000
        let sec = time / 100 - (min*60)
        let ssec = time % 100
        let output = String(format: "%02d:%02d:%02d", min, sec, ssec)
        timeLabel.text = output
    }
    
    func ChangeButtonState(start : Bool, pause : Bool, stop : Bool){
        startButton.isEnabled = start
        pauseButton.isEnabled = pause
        resetButton.isEnabled = stop
        
    }
}

