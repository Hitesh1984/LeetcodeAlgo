//
//  arrangingCoins-441.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/28/25.

 
 /*
https://leetcode.com/problems/arranging-coins/description/?envType=problem-list-v2&envId=math

You have n coins and you want to build a staircase with these coins. The staircase consists of k rows where the ith row has exactly i coins. The last row of the staircase may be incomplete.

Given the integer n, return the number of complete rows of the staircase you will build.

 

Example 1:


Input: n = 5
Output: 2
Explanation: Because the 3rd row is incomplete, we return 2.
Example 2:


Input: n = 8
Output: 3
Explanation: Because the 4th row is incomplete, we return 3.
 

Constraints:

1 <= n <= 231 - 1
*/


func arrangeCoins(_ n: Int) -> Int {
    var (l,r) = (0,n)
    while l <= r {
        let mid = (l + r) / 2
        let res = (mid * (mid + 1) ) / 2
        if res == n { return mid }
        res < n ? ( l = mid + 1) : (r = mid - 1)
    }
    return r
}
