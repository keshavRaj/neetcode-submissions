class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var imageCopy = image
        if imageCopy[sr][sc] == color { return imageCopy }
        fill(&imageCopy, sr, sc, color, imageCopy[sr][sc])
        return imageCopy
    }

    func fill(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ color: Int, _ originalColor: Int) {
        let rows = image.count
        if min(sr, sc) < 0 ||
        sr >= rows ||
        sc >= image[sr].count ||
        image[sr][sc] != originalColor {
            return
        }
        image[sr][sc] = color
        fill(&image, sr + 1, sc, color, originalColor)
        fill(&image, sr - 1, sc, color, originalColor)
        fill(&image, sr, sc + 1, color, originalColor)
        fill(&image, sr, sc - 1, color, originalColor)
    }
}
