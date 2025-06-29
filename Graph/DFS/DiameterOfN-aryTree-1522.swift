//
//  DiameterOfN-aryTree-1522.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/21/25.
/*
 https://leetcode.com/problems/diameter-of-n-ary-tree/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a root of an N-ary tree, you need to compute the length of the diameter of the tree.

 The diameter of an N-ary tree is the length of the longest path between any two nodes in the tree. This path may or may not pass through the root.

 (Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value.)

  

 Example 1:



 Input: root = [1,null,3,2,4,null,5,6]
 Output: 3
 Explanation: Diameter is shown in red color.
 Example 2:



 Input: root = [1,null,2,null,3,4,null,5,null,6]
 Output: 4
 Example 3:



 Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 Output: 7
  

 Constraints:

 The depth of the n-ary tree is less than or equal to 1000.
 The total number of nodes is between [1, 104].

 */

public class multiAryNode {
      public var val: Int
      public var children: [multiAryNode]
      public init(_ val: Int) {
          self.val = val
          self.children = []
      }
  }

func diameter(_ root: multiAryNode?) -> Int {
    var diameter = 0
    func dfs(_ node: multiAryNode?) -> Int {
        guard let node else {
            return 0
        }
        var max1 = 0
        var max2 = 0
        for child in node.children {
            let childH = dfs(child)
            if childH > max1 {
                max2 = max1
                max1 = childH
            } else {
                max2 = max(max2, childH)
            }
        }
        diameter = max(diameter, max1 + max2)
        return 1 + max1
    }
    dfs(root)
    return diameter
}
