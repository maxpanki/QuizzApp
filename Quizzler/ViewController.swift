//
//  ViewController.swift
//  Quizzler
//
//  Created by Maksim Pansevich on 05/12/19.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let questionBank = QuestionBank()
    var tapAnswer: Bool = false
    var currentQuestion: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            tapAnswer = true
        }
        else if sender.tag == 2 {
            tapAnswer = false
        }
        checkAnswer(number: currentQuestion)
        nextQuestion()
        updateUI()
  
    }
    
    
    func updateUI() {
        
        questionLabel.text = questionBank.questionArray[currentQuestion].questionText
        progressLabel.text = "\(currentQuestion + 1)/13"
        scoreLabel.text = "Score: \(score)"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(currentQuestion + 1)
    
    }
    

    func nextQuestion() {
        
        if currentQuestion == 12 {
            
            let alert = UIAlertController(title: "You have complete the Quiz!", message: "Do you want to complete it once again?", preferredStyle: .alert)
            let alertRestarAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(alertRestarAction)
            
            present(alert, animated: true, completion: nil)
            
        }
        else{
            currentQuestion+=1
        }
    }
    
    
    func checkAnswer(number: Int) {
        
        let correctAnswer = questionBank.questionArray[number].rightAnswer
        
        if correctAnswer == tapAnswer{
            ProgressHUD.showSuccess("Correct!")
            score += 10
        }
        else{
            ProgressHUD.showError("Wrong!")
        }
        
    }
    
    
    func startOver() {
        
        currentQuestion = 0
        score = 0
        updateUI()
       
    }
    

    
}
