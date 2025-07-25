//
//  canPlaceFlowers-605.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/1/25.
/*
 https://leetcode.com/problems/can-place-flowers/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return true if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule and false otherwise.

  

 Example 1:

 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: true
 Example 2:

 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false
  

 Constraints:

 1 <= flowerbed.length <= 2 * 104
 flowerbed[i] is 0 or 1.
 There are no two adjacent flowers in flowerbed.
 0 <= n <= flowerbed.length

 */

func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    if n <= 0 { return true}
    var wasZero = true
    var result = n
    for i in 0 ..< flowerbed.count {
        if flowerbed[i] == 0 {
            if wasZero && (i == flowerbed.count - 1 || flowerbed[i + 1] == 0) {
                result -= 1
                if result == 0 { return true}
                wasZero = false
            } else {
                wasZero = true
            }
        } else {
            wasZero = false
        }
    }
    return  false
}
