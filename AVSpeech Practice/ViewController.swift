//
//  ViewController.swift
//  AVSpeech Practice
//
//  Created by 邱士宸 on 2019/8/27.
//  Copyright © 2019 Shih Chen Chiu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var speechInput: UITextField!
    @IBOutlet weak var speechRate: UISlider!
    @IBOutlet weak var speechPitch: UISlider!
    @IBOutlet weak var rateValue: UILabel!
    @IBOutlet weak var pitchValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rateChange(_ sender: Any) {
        rateValue.text = String(format: "%.1f", speechRate.value)
    }
    
    @IBAction func pitchChange(_ sender: Any) {
        pitchValue.text = String(format: "%.1f", speechPitch.value)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let speechUtterance = AVSpeechUtterance(string: speechInput.text!)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        speechUtterance.pitchMultiplier = speechPitch.value
        speechUtterance.rate = speechRate.value
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    @IBAction func buttonPressed2(_ sender: Any) {
        let speechUtteranceLow = AVSpeechUtterance(string: speechInput.text!)
        speechUtteranceLow.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        if speechPitch.value != 0{
            speechUtteranceLow.pitchMultiplier = speechPitch.value*0.8}
        else {
            speechUtteranceLow.pitchMultiplier = 0.8
        }
        speechUtteranceLow.rate = speechRate.value
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtteranceLow)
    }
    
    @IBAction func buttonPressed3(_ sender: Any) {
        let speechUtteranceSlow = AVSpeechUtterance(string: speechInput.text!)
        speechUtteranceSlow.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        speechUtteranceSlow.pitchMultiplier = speechPitch.value
        if speechRate.value != 0 {
            speechUtteranceSlow.rate = speechRate.value*0.7
        }
        else {
            speechUtteranceSlow.rate = 0.4
        }
        speechUtteranceSlow.pitchMultiplier = speechPitch.value
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtteranceSlow)
    }
}

