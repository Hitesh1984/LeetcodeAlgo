//
//  zenomeSequence.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/23/25.


func TestCases(){
    let res = getDNA("mzmoz", "z")
    print(res) // 3
    let res2 = getDNA("zoz", "z")
    print(res2) // 2
    let res3 = getDNA("AXAXzAXAXAXAXzAXAXAXz", "z")
    print(res3)
    let res4 = getDNA("AXAXAXzAXAXAXAXzAXAXz", "z")
    print(res4)
    let res5 = getDNA("AXAXzAXAXAXzAXAXAXAXz", "z")
    print(res5)
    let res6 = getDNA("AXAXAXzAXAXzAXAXAXAXz", "z")
    print(res6)
    let res7 = getDNA("AXAXzAXAXAXzAXAXAXAXz", "z")
    print(res7)
    let res8 = getDNA("AXAXAXAXzAXAXAXzAXAXz", "z")
    print(res8)
    let res9 = getDNA("AXAXAXAXzAXAXzAXAXAXz", "z")
    print(res9)
    let res10 = getDNA("AXAXAXAXzAXAXAXzAXAX", "z")
    print(res10)
    let res11 = getDNA("AXAXzAXAXAXAXzAXAXAX", "z")
    print(res11)
    let res12 = getDNA("AXAXAXAX", "z")
    print(res12)
}


func getDNA(_ genome : String, _ mutation : Character) -> Int {
    if genome.isEmpty {
        return 0
    }
    if String(mutation) == "" {
        return 0
    }
    var mutationIndex = [Int]()
    var diff = 0
    var lastIndex = -1
    for (index,ch) in genome.enumerated() {
        if ch == mutation {
            mutationIndex.append(index)
            if mutationIndex.count == 1 {
                diff = max(diff, index-0)
                lastIndex = index
            } else {
                
                diff = max(diff, index-lastIndex)
                lastIndex = index
            }
        }
    }
    return diff
    
    /* below code is not needed, but I just put for reference purpose */
    var result = 0
    var genome = Array(genome)
    while genome.count > 0 {
        var newGenome = genome
        var operation = 0
        for (index, val) in mutationIndex.enumerated() {
            if val > 0 && genome.count > val {
                let newIndex = val-1-operation
                newGenome.remove(at: newIndex)
                mutationIndex[index] = newIndex
                operation += 1
            }
        }
        genome = newGenome
        if operation > 0 {
            result += 1
        } else {
            return result
        }
    }
    return result
}
