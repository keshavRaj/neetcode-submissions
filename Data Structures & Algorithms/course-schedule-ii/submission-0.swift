class Solution {
    var order: [Int] = []
    var completed:Set<Int> = []
    var adjacencyList:[Int: [Int]] = [:]

    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        adjacencyList = createAdjacencyList(prerequisites)
        for i in 0..<numCourses {
            var path = Set<Int>()
            if !completed.contains(i) {
                if !DFS(i, &path) {
                    return []
                }
            }
        }
        return order.reversed()

    }

    func createAdjacencyList(_ prerequisites: [[Int]]) -> [Int: [Int]] {
        var adjancency: [Int: [Int]] = [:]
        for prerequisite in prerequisites {
            adjancency[prerequisite[1], default:[]].append(prerequisite[0])
        }
        return adjancency
    }

    func DFS(_ cur: Int, _ curPath: inout Set<Int>) -> Bool {
        if curPath.contains(cur) {
            return false
        }
        if completed.contains(cur) {
            return true
        }
        curPath.insert(cur)
        let neighbors = adjacencyList[cur] ?? []
        for neighbor in neighbors {
            if !DFS(neighbor, &curPath) {
                return false
            }
        }
        completed.insert(cur)
        order.append(cur)
        curPath.remove(cur)
        return true
    }
}
