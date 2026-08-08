class TimeMap {
    struct Value{
        let value: String
        let timestamp: Int
    }
    private var timeMap: [String: [Value]] = [:]

    init() {

    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        let value = Value(value: value, timestamp: timestamp)
        timeMap[key, default: [Value]()].append(value)
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let values = timeMap[key] else { return "" }
        var bestSeenValue = ""
        var left = 0
        var right = values.count - 1
        while(left <= right) {
            let mid = (left + right) / 2
            let cur = values[mid]
            if (cur.timestamp == timestamp) {
                return cur.value
            } else if (cur.timestamp > timestamp) {
                right = mid - 1
            } else {
                bestSeenValue = cur.value
                left = mid + 1
            }
        }
        return bestSeenValue
    }
}
