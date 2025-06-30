//
//  DominoAndTrominoTiling.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/10/25.

/*
 https://leetcode.com/problems/domino-and-tromino-tiling/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You have two types of tiles: a 2 x 1 domino shape and a tromino shape. You may rotate these shapes.


 Given an integer n, return the number of ways to tile an 2 x n board. Since the answer may be very large, return it modulo 109 + 7.

 In a tiling, every square must be covered by a tile. Two tilings are different if and only if there are two 4-directionally adjacent cells on the board such that exactly one of the tilings has both squares occupied by a tile.

  

 Example 1:


 Input: n = 3
 Output: 5
 Explanation: The five different ways are shown above.
 Example 2:

 Input: n = 1
 Output: 1
  

 Constraints:

 1 <= n <= 1000

 */
func numTilings(_ n: Int) -> Int {
    if n < 3 { return n }
    let mod = 1_000_000_007
    var dp = [1,1,2]
    for i in 3...n {
        dp.append((dp[i-1] * 2 + dp[i-3]) % mod)
    }
    return dp[n]
}
