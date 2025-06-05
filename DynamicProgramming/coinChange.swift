//
//  coinChange.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/15/25.

/*
 https://leetcode.com/problems/coin-change/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
 
 Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
 
 You may assume that you have an infinite number of each kind of coin.
 
 
 
 Example 1:
 
 Input: coins = [1,2,5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 Example 2:
 
 Input: coins = [2], amount = 3
 Output: -1
 Example 3:
 
 Input: coins = [1], amount = 0
 Output: 0
 
 
 Constraints:
 
 1 <= coins.length <= 12
 1 <= coins[i] <= 231 - 1
 0 <= amount <= 104
 */

import Foundation


func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    guard amount > 0 else { return 0 }

    var solutions = [Int](repeating: amount + 1, count: amount + 1)
    solutions[0] = 0

    for currentAmount in 1...amount {
        for coin in coins where coin <= currentAmount {
            solutions[currentAmount] = min(solutions[currentAmount], solutions[currentAmount - coin] + 1)
        }
    }

    // We return -1 if a solution was not found (in this case, if the value equals the initial value we set as `amount - 1`).
    return solutions[amount] != amount + 1 ? solutions[amount] : -1
}

