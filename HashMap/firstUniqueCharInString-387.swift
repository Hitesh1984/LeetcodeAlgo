//
//  firstUniqueCharInString-387.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/11/25.

/*
 https://leetcode.com/problems/first-unique-character-in-a-string/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

  

 Example 1:

 Input: s = "leetcode"

 Output: 0

 Explanation:

 The character 'l' at index 0 is the first character that does not occur at any other index.

 Example 2:

 Input: s = "loveleetcode"

 Output: 2

 Example 3:

 Input: s = "aabb"

 Output: -1

  

 Constraints:

 1 <= s.length <= 105
 s consists of only lowercase English letters.

 */

func firstUniqChar(_ s: String) -> Int {
    var hashMap = [Character:Int]()
    for char in s {
        hashMap[char, default:0] += 1
    }
    for (index,char) in s.enumerated() {
        if hashMap[char, default:0] == 1 {
            return index
        }
    }
    return -1
    defer {
        hashMap.removeAll()
    }
}


/*
 import XCTest

 // Executed 3 tests, with 0 failures (0 unexpected) in 0.045 (0.048) seconds

 class Tests: XCTestCase {
     private let s = Solution()
     func test0() {
         let res = s.firstUniqChar("leetcode")
         XCTAssertEqual(res, 0)
     }
     func test1() {
         let res = s.firstUniqChar("loveleetcode")
         XCTAssertEqual(res, 2)
     }
     func test2() {
         let res = s.firstUniqChar("aabb")
         XCTAssertEqual(res, -1)
     }
 }

 Tests.defaultTestSuite.run()
 */
