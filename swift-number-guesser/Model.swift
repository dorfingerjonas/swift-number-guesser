class Model {
    var gameWon = false
    var guesses = [Int]()
    var numberToGuess = Int.random(in: 1...51)
    
    func clear() {
        guesses = [Int]()
        numberToGuess = Int.random(in: 1...51)
        gameWon = false
    }
}
