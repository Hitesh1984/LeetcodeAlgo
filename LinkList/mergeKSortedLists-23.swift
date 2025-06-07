//
//  mergeKSortedLists-23.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/1/25.
//

import Foundation

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard !lists.isEmpty else { return nil }
    let n = lists.count
    var interval = 1
    var lists = lists
    while interval < n {
        var i = 0
        while (interval + i) < n {
            lists[i] = mergeTwoLists(lists[i], lists[i+interval])
            i += interval * 2
        }
        interval *= 2
    }
    return lists[0]
}

private func mergeTwoSortedLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummy = ListNode(-1)
    var cur:ListNode? = dummy
    var l1 = l1
    var l2 = l2
    while l1 != nil || l2 != nil {
        if let l1Val = l1?.val, let l2Val = l2?.val {
            if l1Val < l2Val {
                cur?.next = l1
                l1 = l1?.next
            } else {
                cur?.next = l2
                l2 = l2?.next
            }
        } else if l1 != nil {
            cur?.next = l1
            l1 = l1?.next
            
        } else if l2 != nil {
            cur?.next = l2
            l2 = l2?.next
        }
        cur = cur?.next
    }
    return dummy.next
}
