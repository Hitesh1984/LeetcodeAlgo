//
//  sortOutGroupingLogs.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/19/25.
/*
 
 https://www.mycompiler.io/view/9poMvLCx5NN
 
 You are analyzing data for Aquaintly, a hot new social network.

 On Aquaintly, connections are always symmetrical. If a user Alice is connected to Bob, then Bob is also connected to Alice.

 You are given a sequential log of CONNECT and DISCONNECT events of the following form:
 - This event connects users Alice and Bob: ["CONNECT", "Alice", "Bob"]
 - This event disconnects the same users: ["DISCONNECT", "Bob", "Alice"] (order of users does not matter)

 We want to separate users based on their popularity (number of connections). To do this, write a function that takes in the event log and a number N and returns two collections:
 [Users with fewer than N connections], [Users with N or more connections]

 Example:
 events = [
     ["CONNECT","Alice","Bob"],
     ["DISCONNECT","Bob","Alice"],
     ["CONNECT","Alice","Charlie"],
     ["CONNECT","Dennis","Bob"],
     ["CONNECT","Pam","Dennis"],
     ["DISCONNECT","Pam","Dennis"],
     ["CONNECT","Pam","Dennis"],
     ["CONNECT","Edward","Bob"],
     ["CONNECT","Dennis","Charlie"],
     ["CONNECT","Alice","Nicole"],
     ["CONNECT","Pam","Edward"],
     ["DISCONNECT","Dennis","Charlie"],
     ["CONNECT","Dennis","Edward"],
     ["CONNECT","Charlie","Bob"]
 ]
 
 Using a target of 3 connections, the expected results are:
 Users with less than 3 connections: ["Alice", "Charlie", "Pam", "Nicole"]
 Users with 3 or more connections: ["Dennis", "Bob", "Edward"]

 All test cases:
 grouping(events, 3) => [["Alice", "Charlie", "Pam", "Nicole"], ["Dennis", "Bob", "Edward"]]
 grouping(events, 1) => [[], ["Alice", "Charlie", "Dennis", "Bob", "Pam", "Edward", "Nicole"]]
 grouping(events, 10) => [["Alice", "Charlie", "Dennis", "Bob", "Pam", "Edward", "Nicole"], []]
 Complexity Variable:
 E = number of events

 */
 
class sortOut {
    var hashMap2 = [Int:[String]]()
    var count = Int.min
    init(_ events:[[String]]) {
        count = events.count
        var hashMap = [String:Int]()
        for event in events {
            let add = event[0].uppercased() == "CONNECT" ? 1 : -1
            hashMap[event[1], default:0] += add
            hashMap[event[2], default:0] += add
        }
        for (key, val) in hashMap {
            hashMap2[val, default:[]].append(key)
            hashMap.removeValue(forKey: key)
        }
        hashMap = [:]
    }
    
    func grouping(_ n:Int)->[[String]] {
        var ans = [[String]]()
        var before = [String]()
        var after = [String]()
        for i in 1...count {
            var res = hashMap2[i, default:[]]
            while !res.isEmpty {
                if i < n {
                    before.append(res.removeFirst())
                } else {
                    after.append(res.removeFirst())
                }
            }
        }
        ans.append(before)
        ans.append(after)
        return  ans
    }
}

func testcasesOfSortGroup() {
    let events = [
      ["CONNECT","Alice","Bob"],
      ["DISCONNECT","Bob","Alice"],
      ["CONNECT","Alice","Charlie"],
      ["CONNECT","Dennis","Bob"],
      ["CONNECT","Pam","Dennis"],
      ["DISCONNECT","Pam","Dennis"],
      ["CONNECT","Pam","Dennis"],
      ["CONNECT","Edward","Bob"],
      ["CONNECT","Dennis","Charlie"],
      ["CONNECT","Alice","Nicole"],
      ["CONNECT","Pam","Edward"],
      ["DISCONNECT","Dennis","Charlie"],
      ["CONNECT","Dennis","Edward"],
      ["CONNECT","Charlie","Bob"]
    ]
    
    let obj1 = sortOut(events)
    let res1 = obj1.grouping(3)
    print(res1)
    let res2 = obj1.grouping(1)
    print(res2)
    let res3 = obj1.grouping(10)
    print(res3)
}
