//
//  constructBinaryTreeFromString-536.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/29/25.
/*
 https://leetcode.com/problems/construct-binary-tree-from-string/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You need to construct a binary tree from a string consisting of parenthesis and integers.

 The whole input represents a binary tree. It contains an integer followed by zero, one or two pairs of parenthesis. The integer represents the root's value and a pair of parenthesis contains a child binary tree with the same structure.

 You always start to construct the left child node of the parent first if it exists.

  

 Example 1:


 Input: s = "4(2(3)(1))(6(5))"
 Output: [4,2,6,3,1,5]
 Example 2:

 Input: s = "4(2(3)(1))(6(5)(7))"
 Output: [4,2,6,3,1,5,7]
 Example 3:

 Input: s = "-4(2(3)(1))(6(5)(7))"
 Output: [-4,2,6,3,1,5,7]
  

 Constraints:

 0 <= s.length <= 3 * 104
 s consists of digits, '(', ')', and '-' only.
 All numbers in the tree have value at most than 230.
 */

func str2tree(_ s: String) -> TreeNode? {
    guard !s.isEmpty else { return nil }
    var s = Array(s), index = 0
    func parseNodes() -> TreeNode? {
        var curNum = 0
        var root: TreeNode? = nil
        var left: TreeNode? = nil
        var right: TreeNode? = nil
        var isNeg = false
        if s[index] == "-" { isNeg = true; index += 1 }
        while index < s.count, let num = s[index].wholeNumberValue {
            curNum = curNum*10 + num
            index += 1
        }
        curNum = isNeg ? -curNum : curNum
        if index < s.count, s[index] == "(" {
            index += 1
            left = parseNodes()
            index += 1
        }
        if index < s.count, s[index] == "(" {
            index += 1
            right = parseNodes()
            index += 1
        }
        return TreeNode(left: left, value: curNum, right: right)
        //return TreeNode(curNum, left, right)
    }
    return parseNodes()
}
