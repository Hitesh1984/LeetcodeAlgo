//
//  sortList-148.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/28/25.
/*
 https://leetcode.com/problems/sort-list/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given the head of a linked list, return the list after sorting it in ascending order.

  

 Example 1:


 Input: head = [4,2,1,3]
 Output: [1,2,3,4]
 Example 2:


 Input: head = [-1,5,3,4,0]
 Output: [-1,0,3,4,5]
 Example 3:

 Input: head = []
 Output: []
  

 Constraints:

 The number of nodes in the list is in the range [0, 5 * 104].
 -105 <= Node.val <= 105
  
 */


func sortList(_ head: ListNode?) -> ListNode? {
    guard let head = head, head.next != nil else {
        return head
    }
    
    let mid = getMid(head)
    let right = sortList(mid.next)
    mid.next = nil
    let left = sortList(head)
    
    return merge(left, right)
}

private func getMid(_ head: ListNode) -> ListNode {
    var slow: ListNode? = head
    var fast: ListNode? = head.next
    
    while let f = fast, let next = f.next {
        slow = slow?.next
        fast = next.next
    }
    
    return slow!
}

private func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var tail = dummy
    var l1 = l1
    var l2 = l2
    
    while let node1 = l1, let node2 = l2 {
        if node1.val < node2.val {
            tail.next = node1
            l1 = node1.next
        }
        else {
            tail.next = node2
            l2 = node2.next
        }
        tail = tail.next!
    }
    
    tail.next = l1 ?? l2
    return dummy.next
}
