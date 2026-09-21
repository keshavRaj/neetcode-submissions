class Solution {
    var wildcardDict: [String: [String]] = [:]
    var seen: Set<String> = []
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard wordList.contains(endWord) else { return 0 }
        for word in wordList {
            addToWildCardDict(word)
        }
        let queue = Queue()
        seen.insert(beginWord)
        queue.enqueue(beginWord)
        var count = 1
        while (!queue.isEmpty) {
            for _ in 1...queue.count {
                let neighbor = queue.dequeue()!
                let wildCards = getWildCards(neighbor)
                for wildCard in wildCards {
                    let words = wildcardDict[wildCard] ?? []
                    for word in words {
                        if word == endWord {
                        return count + 1
                    }
                    if !seen.contains(word) {
                        queue.enqueue(word)
                        seen.insert(word)
                    }
                    }
                }
            }
            count += 1
        }
        return 0

    }

    func addToWildCardDict(_ word: String) {
        let wildCards = getWildCards(word)
        for wildCard in wildCards {
            wildcardDict[wildCard, default:[]].append(word)
        }
    }

    func getWildCards(_ word: String) -> [String] {
       var characters = Array(word)
       var wildCards: [String] = [] 
        for i in 0..<characters.count {
            let char = characters[i]
            characters[i] = "*"
            let pattern = String(characters)
            wildCards.append(pattern)
            characters[i] = char
        } 
        return wildCards
    } 
}

class Queue {
    private var elements: [String] = []
    private var front = 0
    var isEmpty: Bool {
        return front >= elements.count
    }

    var count: Int {
        return elements.count - front
    }

    func enqueue(_ val: String) {
        elements.append(val)
    }

    func dequeue() -> String? {
        guard !isEmpty else { return nil }
        let res = elements[front]
        front += 1
        return res
    }
}
