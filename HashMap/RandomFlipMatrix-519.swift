//
//  RandomFlipMatrix-519.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 10/7/25.
//

/*
 https://leetcode.com/problems/random-flip-matrix/description/?envType=problem-list-v2&envId=math
 
 There is an m x n binary grid matrix with all the values set 0 initially. Design an algorithm to randomly pick an index (i, j) where matrix[i][j] == 0 and flips it to 1. All the indices (i, j) where matrix[i][j] == 0 should be equally likely to be returned.

 Optimize your algorithm to minimize the number of calls made to the built-in random function of your language and optimize the time and space complexity.

 Implement the Solution class:

 Solution(int m, int n) Initializes the object with the size of the binary matrix m and n.
 int[] flip() Returns a random index [i, j] of the matrix where matrix[i][j] == 0 and flips it to 1.
 void reset() Resets all the values of the matrix to be 0.
  

 Example 1:

 Input
 ["Solution", "flip", "flip", "flip", "reset", "flip"]
 [[3, 1], [], [], [], [], []]
 Output
 [null, [1, 0], [2, 0], [0, 0], null, [2, 0]]

 Explanation
 Solution solution = new Solution(3, 1);
 solution.flip();  // return [1, 0], [0,0], [1,0], and [2,0] should be equally likely to be returned.
 solution.flip();  // return [2, 0], Since [1,0] was returned, [2,0] and [0,0]
 solution.flip();  // return [0, 0], Based on the previously returned indices, only [0,0] can be returned.
 solution.reset(); // All the values are reset to 0 and can be returned.
 solution.flip();  // return [2, 0], [0,0], [1,0], and [2,0] should be equally likely to be returned.
  

 Constraints:

 1 <= m, n <= 104
 There will be at least one free cell for each call to flip.
 At most 1000 calls will be made to flip and reset.
 */

import Foundation

class RandomFlipSolution {

    private var cols: Int
    private var len: Int
    private var dict: [Int: Bool]

    init(_ n_rows: Int, _ n_cols: Int) {
        self.cols = n_cols
        self.len = n_rows * n_cols
        self.dict = [Int: Bool]()
    }
    
    func flip() -> [Int] {
        var rand = -1
        repeat {
            rand = Int.random(in: 0..<len)
        } while dict[rand, default: false]
        dict[rand] = true
        return([rand / cols, rand % cols])
    }
    
    func reset() {
        dict.removeAll()
    }
}

