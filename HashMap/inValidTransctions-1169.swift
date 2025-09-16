//
//  inValidTransctions-1169.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/16/25.
/*
 https://leetcode.com/problems/invalid-transactions/description/?envType=company&envId=paypal&favoriteSlug=paypal-more-than-six-months
 
 A transaction is possibly invalid if:

 the amount exceeds $1000, or;
 if it occurs within (and including) 60 minutes of another transaction with the same name in a different city.
 You are given an array of strings transaction where transactions[i] consists of comma-separated values representing the name, time (in minutes), amount, and city of the transaction.

 Return a list of transactions that are possibly invalid. You may return the answer in any order.

  

 Example 1:

 Input: transactions = ["alice,20,800,mtv","alice,50,100,beijing"]
 Output: ["alice,20,800,mtv","alice,50,100,beijing"]
 Explanation: The first transaction is invalid because the second transaction occurs within a difference of 60 minutes, have the same name and is in a different city. Similarly the second one is invalid too.
 Example 2:

 Input: transactions = ["alice,20,800,mtv","alice,50,1200,mtv"]
 Output: ["alice,50,1200,mtv"]
 Example 3:

 Input: transactions = ["alice,20,800,mtv","bob,50,1200,mtv"]
 Output: ["bob,50,1200,mtv"]
  

 Constraints:

 transactions.length <= 1000
 Each transactions[i] takes the form "{name},{time},{amount},{city}"
 Each {name} and {city} consist of lowercase English letters, and have lengths between 1 and 10.
 Each {time} consist of digits, and represent an integer between 0 and 1000.
 Each {amount} consist of digits, and represent an integer between 0 and 2000.
 */

import Foundation


struct Transaction {
    let name: String
    let time: Int
    let amount: Int
    let city: String
    init(_ transaction: String) {
        let transaction = transaction.split(separator: ",")
        self.name = String(transaction[0])
        self.time = Int(transaction[1])!
        self.amount = Int(transaction[2])!
        self.city = String(transaction[3])
    }
}

func invalidTransactions(_ transactions: [String]) -> [String] {
    let trans = transactions.map(Transaction.init)
    var transMap = [String: [Transaction]]()
    for tr in trans {
        transMap[tr.name, default:[]].append(tr)
    }
    var invalidTrans = [String]()
    for (index,tr) in trans.enumerated() where isInValidTrans(tr){
        invalidTrans.append(transactions[index])
    }
    return invalidTrans
    
    func isInValidTrans(_ tr: Transaction) -> Bool {
        guard tr.amount <= 1000 else { return true }
        for otherTrans in transMap[tr.name, default: []] {
            let timeDiff = abs(tr.time - otherTrans.time)
            if timeDiff <= 60 && otherTrans.city != tr.city {
                return true
            }
        }
        return false
    }
}
