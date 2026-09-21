class Solution {
    var adjacencyList: [Int: [Int]] = [:]
    var visited: Set<Int> = []
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        createAdjacencyList(edges)
        var components = 0
        for i in 0..<n {
            if !visited.contains(i) {
                components += 1
                DFS(i)
            }
        }
        return components
    }

    func createAdjacencyList(_ edges: [[Int]]) {
        for edge in edges {
            let src = edge[0]
            let dest = edge[1]
            adjacencyList[src, default:[]].append(dest)
            adjacencyList[dest, default:[]].append(src)
        }
    }

    func DFS(_ n: Int) {
        visited.insert(n)
        let neighbors = adjacencyList[n] ?? []
        for neighbor in neighbors {
            if !visited.contains(neighbor) {
                DFS(neighbor)
            }
        }
        return
    }
}
