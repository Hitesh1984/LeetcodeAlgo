//
//  selfDividingNumbers-728.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/28/25.
/*
 https://leetcode.com/problems/self-dividing-numbers/description/?envType=problem-list-v2&envId=math
 
 A self-dividing number is a number that is divisible by every digit it contains.

 For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.
 A self-dividing number is not allowed to contain the digit zero.

 Given two integers left and right, return a list of all the self-dividing numbers in the range [left, right] (both inclusive).

  

 Example 1:

 Input: left = 1, right = 22
 Output: [1,2,3,4,5,6,7,8,9,11,12,15,22]
 Example 2:

 Input: left = 47, right = 85
 Output: [48,55,66,77]
  

 Constraints:

 1 <= left <= right <= 104 
 */

func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
    var result = [Int]()
    for i in left...right {
        var num = i
        while num != 0 {
            let rem = num % 10
            if rem == 0 || i % rem != 0 { break }
            num = num / 10
        }
        
        if num == 0 {
            result.append(i)
        }
    }
    return result
}
