//
//  ViewController.swift
//  FlashCard
//
//  Created by Behzad Dogahe on 7/1/21.
//

/*
 Create a division flashcard game. User is presented with a division question such as 10 / 5 = 2 and the program expects the answer from the user. If the user gets the answer right, the question should be removed from the pool of questions. If the user gets the answer worng he/she could be presented with the same question again. 
 */

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    var questions: [Question] = []
    var currQuestion: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = createQuestions()
        showQuestion()
    }
    
    func showQuestion() {
        textField.text = ""
        currQuestion = getQuestion()
        if let currQuestion = currQuestion {
            questionLabel.text = "\(currQuestion.left) / \(currQuestion.right) = ?"
        }
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        if let txt = textField.text, let currQuestion = currQuestion {
            if let num = Int(txt) {
                if num == currQuestion.ans {
                    print("✅")
                    if let index = questions.firstIndex(where:  { $0.index == currQuestion.index } ) {
                        questions.remove(at: index)
                        print("Question \(currQuestion.index) removed -  Remaining: \(questions.count)")
                    }
                    showQuestion()
                } else {
                    print("❌")
                    showQuestion()
                }
            }
        }
    }
    
    
    func createQuestions() -> [Question] {
        var questions: [Question] = []
        var index = 0
        for i in 1 ..< 13 {
            for j in 1 ..< 13 {
                let q = Question(index: index, left: i * j, right: i, ans: j)
                questions.append(q)
                index += 1
            }
        }
        return questions
    }
    
    func getQuestion() -> Question {
        var randomIndex = Int.random(in: 0 ..< questions.count)
        return questions[randomIndex]
    }


}


struct Question {
    var index: Int
    var left: Int
    var right: Int
    var ans: Int
}
