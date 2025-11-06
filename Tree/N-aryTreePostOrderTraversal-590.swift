//
//  N-aryTreePostOrderTraversal-590.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 9/23/25.
//

/*
 https://leetcode.com/problems/n-ary-tree-postorder-traversal/?envType=problem-list-v2&envId=depth-first-search
 
 Given the root of an n-ary tree, return the postorder traversal of its nodes' values.

 Nary-Tree input serialization is represented in their level order traversal. Each group of children is separated by the null value (See examples)

  

 Example 1:


 Input: root = [1,null,3,2,4,null,5,6]
 Output: [5,6,3,2,4,1]
 Example 2:


 Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 Output: [2,6,14,11,7,3,12,8,4,13,9,10,5,1]
  

 Constraints:

 The number of nodes in the tree is in the range [0, 104].
 0 <= Node.val <= 104
 The height of the n-ary tree is less than or equal to 1000.
  
 */

import Foundation


func postorder(_ root: NAryNode?) -> [Int] {
        var res = [Int]()
        post(root)
        return res

        func post(_ root:NAryNode?) {
            guard let root = root else { return  }
            for child in root.children {
                post(child)
            }
            res.append(root.val)
        }
    }
