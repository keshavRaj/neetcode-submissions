class Solution {
    var adjacencyList:[Int: [Int]] = [:]
    var visited: Set<Int> = []
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        for edge in edges {
            visited = []
            if DFS(edge[0],edge[1]) {
                return edge
            } else {
                adjacencyList[edge[0], default: []].append(edge[1])
                adjacencyList[edge[1], default: []].append(edge[0])
            }
        }
        return edges.last!

    }

    func DFS(_ src: Int, _ dest: Int) -> Bool {
        if src == dest {
            return true
        }
        visited.insert(src)
        let neighbors = adjacencyList[src] ?? []
        for neighbor in neighbors {
            if !visited.contains(neighbor) {
                if DFS(neighbor, dest) {
                    return true
                }
            }
        }
        return false
    }
}
