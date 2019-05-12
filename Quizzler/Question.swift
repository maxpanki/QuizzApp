//
//  Question.swift
//  Quizzler
//
//  Created by Maksim Pansevich on 5/12/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation


class Question {
    
    let questionText: String
    let rightAnswer: Bool
    
    init (question: String, answer: Bool){
        
        questionText = question
        rightAnswer = answer
        
    }
    
}
