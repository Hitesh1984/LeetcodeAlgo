//
//  DesignTic-Tac-Toe-348.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/19/25.
/*
 https://leetcode.com/problems/design-tic-tac-toe/description/?envType=problem-list-v2&envId=7p5x763
 
 Assume the following rules are for the tic-tac-toe game on an n x n board between two players:

 A move is guaranteed to be valid and is placed on an empty block.
 Once a winning condition is reached, no more moves are allowed.
 A player who succeeds in placing n of their marks in a horizontal, vertical, or diagonal row wins the game.
 Implement the TicTacToe class:

 TicTacToe(int n) Initializes the object the size of the board n.
 int move(int row, int col, int player) Indicates that the player with id player plays at the cell (row, col) of the board. The move is guaranteed to be a valid move, and the two players alternate in making moves. Return
 0 if there is no winner after the move,
 1 if player 1 is the winner after the move, or
 2 if player 2 is the winner after the move.
  

 Example 1:

 Input
 ["TicTacToe", "move", "move", "move", "move", "move", "move", "move"]
 [[3], [0, 0, 1], [0, 2, 2], [2, 2, 1], [1, 1, 2], [2, 0, 1], [1, 0, 2], [2, 1, 1]]
 Output
 [null, 0, 0, 0, 0, 0, 0, 1]

 Explanation
 TicTacToe ticTacToe = new TicTacToe(3);
 Assume that player 1 is "X" and player 2 is "O" in the board.
 ticTacToe.move(0, 0, 1); // return 0 (no one wins)
 |X| | |
 | | | |    // Player 1 makes a move at (0, 0).
 | | | |

 ticTacToe.move(0, 2, 2); // return 0 (no one wins)
 |X| |O|
 | | | |    // Player 2 makes a move at (0, 2).
 | | | |

 ticTacToe.move(2, 2, 1); // return 0 (no one wins)
 |X| |O|
 | | | |    // Player 1 makes a move at (2, 2).
 | | |X|

 ticTacToe.move(1, 1, 2); // return 0 (no one wins)
 |X| |O|
 | |O| |    // Player 2 makes a move at (1, 1).
 | | |X|

 ticTacToe.move(2, 0, 1); // return 0 (no one wins)
 |X| |O|
 | |O| |    // Player 1 makes a move at (2, 0).
 |X| |X|

 ticTacToe.move(1, 0, 2); // return 0 (no one wins)
 |X| |O|
 |O|O| |    // Player 2 makes a move at (1, 0).
 |X| |X|

 ticTacToe.move(2, 1, 1); // return 1 (player 1 wins)
 |X| |O|
 |O|O| |    // Player 1 makes a move at (2, 1).
 |X|X|X|
  

 Constraints:

 2 <= n <= 100
 player is 1 or 2.
 0 <= row, col < n
 (row, col) are unique for each different call to move.
 At most n2 calls will be made to move
 
 */

import Foundation

class TicTacToe {
    var n: Int = 0
     var rows: [Int] = [Int]()
     var columns: [Int] = [Int]()
     var diagonal: Int = 0
     var antiDiagonal: Int = 0
        

    init(_ n: Int) {
        self.n = n
        self.rows = Array(repeatElement(0, count: n))
        self.columns = Array(repeatElement(0, count: n))
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        
        guard row >= 0, col >= 0, player > 0 else { return 0 }
        let currentPlayer: Int = player == 1 ? 1 : -1
        
        rows[row] += currentPlayer
        if abs(rows[row]) == n { return player }

        columns[col] += currentPlayer
        if abs(columns[col]) == n { return player }

        if row == col {
            diagonal += currentPlayer
            if abs(diagonal) == n { return player }
        }

        if row + col == n - 1 {
            antiDiagonal += currentPlayer
            if abs(antiDiagonal) == n { return player }
        }
            
        return 0
    }
}


class TicTacToe2 {
    var score1 = [Int]()
    var score2 = [Int]()
    var n = Int.min
    init(_ n: Int) {
        score1.reserveCapacity(((n*n) + 1 )/2)
        score2.reserveCapacity(((n*n) + 1 )/2)
        self.n = n
    }
    
    func checkIfWinner(_ score:[Int],_ row: Int, _ col: Int) -> Bool {
        if score.count < n {
            return false
        }
        var rowWise = true
        var colWise = true
        var diagonalWise = true
        var crossDiagonalWise = true

        for i in 0..<n {
            rowWise = rowWise && score.contains((i*n) + col)
            if !rowWise { break }
        }
        if rowWise {
            return true
        }

        for i in 0..<n {
            colWise = colWise && score.contains((row*n) + i)
            if !colWise { break }
        }
        if colWise {
            return true
        }

        for i in 0..<n {
            diagonalWise = diagonalWise && score.contains((i*n) + i)
            if !diagonalWise { break }
        }
        if diagonalWise {
            return true
        }
        
        for i in 0..<n {
            crossDiagonalWise = crossDiagonalWise && score.contains((i*n) + (n-1-i))
            if !crossDiagonalWise { break }
        }
        if crossDiagonalWise {
            return true
        }
        return false
    }


    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {

        if player == 1 {
            score1.append((row*n)+col)
            if checkIfWinner(score1, row, col ) {
                return 1
            } else {
                return 0
            }
        }   else {
            score2.append((row*n)+col)
            if checkIfWinner(score2, row, col) {
                return 2
            } else {
                return 0
            }
        }
    }
}
