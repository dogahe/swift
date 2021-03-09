/*
 18.2 Write a method to shuffle a deck of cards. It must be a perfect shuffle-in other words, each of the 52! permutations of the deck has to be equally likely. Assume that you are given a random number generator which is perfect.
 
 */
import Foundation

func shuffle(_ cards: [Int]) -> [Int] {
    var shuffled = cards
    for i in 0 ..< cards.count {
        let rand = Int.random(in: i ..< cards.count)
        let temp = cards[i]
        shuffled[i] = shuffled[rand]
        shuffled[rand] = temp
    }
    return shuffled
}


let cards = Array(1...52)
shuffle(cards)
