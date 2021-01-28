//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Yi An Chen on 2021/1/25.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], c: String){
        self.text=q
        self.answers=a
        self.correctAnswer=c
    }
}
