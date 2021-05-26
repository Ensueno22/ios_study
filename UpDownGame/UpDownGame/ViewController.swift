//
//  ViewController.swift
//  UpDownGame
//
//  Created by 엔슈에노 on 2021/05/26.
//

import UIKit

class ViewController: UIViewController {

    // 프로퍼티를 인터페이스에 연결
    // MARK:- Properties
    // MARK: IBOUtlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var turnCountLabel: UILabel!
    @IBOutlet var inputField: UITextField!
    
    // MARK: Stored Properties
    var randomNumber: UInt32 = 0
    var turnCount: Int = 0
    
    // MARK:- Methods
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        print("touch up submit button")
        
        guard let inputText = self.inputField.text,
              inputText.isEmpty == false else {
                print("입력 값 없음")
                return
        }
        
        guard let inputNumber: UInt32 = UInt32(inputText) else {
            print("입력 값이 잘못 되었음")
            return
        }
        
        turnCount += 1
        self.turnCountLabel.text = "\(turnCount)"
        
        if inputNumber > randomNumber {
            self.resultLabel.text = "UP!"
        } else if inputNumber < randomNumber {
            self.resultLabel.text = "DOWN!"
        } else {
            self.resultLabel.text = "정답입니다!"
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("reset")
        self.initializeGame()
    }

    // MARK: Custom Methods
    func initializeGame() {
        self.randomNumber = arc4random() % 25
        self.turnCount = 0
        
        self.resultLabel.text = "Start!"
        self.turnCountLabel.text = "\(turnCount)"
        self.inputField.text = nil
    }
    
    @IBAction func tapBackground(_ sender: UITapGestureRecognizer) {
        print("tab")
//        self.view.endEditing(true)
        self.inputField.resignFirstResponder()
//        self.inputField.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeGame()
//        UIButton().addTarget(self, action: #selector(touchUpSubmitButton(_:)), for: UIControl.Event.touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

