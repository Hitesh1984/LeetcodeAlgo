//
//  insertIntoSortedCircularLinkList-708.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/28/25.
//

import Foundation

/*
 https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given a Circular Linked List node, which is sorted in non-descending order, write a function to insert a value insertVal into the list such that it remains a sorted circular list. The given node can be a reference to any single node in the list and may not necessarily be the smallest value in the circular list.

 If there are multiple suitable places for insertion, you may choose any place to insert the new value. After the insertion, the circular list should remain sorted.

 If the list is empty (i.e., the given node is null), you should create a new single circular list and return the reference to that single node. Otherwise, you should return the originally given node.

  

 Example 1:


  
 Input: head = [3,4,1], insertVal = 2
 Output: [3,4,1,2]
 Explanation: In the figure above, there is a sorted circular list of three elements. You are given a reference to the node with value 3, and we need to insert 2 into the list. The new node should be inserted between node 1 and node 3. After the insertion, the list should look like this, and we should still return node 3.



 Example 2:

 Input: head = [], insertVal = 1
 Output: [1]
 Explanation: The list is empty (given head is null). We create a new single circular list and return the reference to that single node.
 Example 3:

 Input: head = [1], insertVal = 0
 Output: [1,0]
  

 Constraints:

 The number of nodes in the list is in the range [0, 5 * 104].
 -106 <= Node.val, insertVal <= 106
 */


public class CircularNode {
      public var val: Int
      public var next: CircularNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }

func insert(_ head: CircularNode?, _ insertVal: Int) -> CircularNode? {
    let newNode = CircularNode(insertVal)
    if head == nil {
        newNode.next = newNode
        return newNode
    }
    var curr = head
    while curr != nil   {
        if let next = curr!.next {
            if curr!.val <= insertVal, insertVal <= next.val { break }
             if curr!.val > next.val {
                 if curr!.val <= insertVal || insertVal <= next.val { break }
             }
            curr = next
            if curr === head { break }
        } else { break }
    }
    newNode.next = curr!.next
    curr!.next = newNode
    return head
}
