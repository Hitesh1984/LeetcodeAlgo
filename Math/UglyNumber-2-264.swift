//
//  UglyNumber-2-264.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 10/1/25.
/*
 https://leetcode.com/problems/ugly-number-ii/description/?envType=problem-list-v2&envId=math
 
 An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.

 Given an integer n, return the nth ugly number.

  

 Example 1:

 Input: n = 10
 Output: 12
 Explanation: [1, 2, 3, 4, 5, 6, 8, 9, 10, 12] is the sequence of the first 10 ugly numbers.
 Example 2:

 Input: n = 1
 Output: 1
 Explanation: 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.
  

 Constraints:

 1 <= n <= 1690
 */

func nthUglyNumber(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    var arr = Array.init(repeating: 0, count: n)
    var p2 = 0
    var p3 = 0
    var p5 = 0
    arr[0] = 1
    var counter = 1
    while counter < n {
        let p2Val = arr[p2] * 2
        let p3Val = arr[p3] * 3
        let p5Val = arr[p5] * 5
        let minVal = min(p2Val, p3Val, p5Val)
        if minVal == p3Val {
            p3 += 1
        }
        if minVal == p5Val {
            p5 += 1
        }
        if minVal == p2Val {
            p2 += 1
        }
        arr[counter] = minVal
        counter += 1
    }
    return arr.last!
}
