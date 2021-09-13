/*
 
 tags:Facebook
 
 71. Simplify Path
 
 Given a string path, which is an absolute path (starting with a slash '/') to a file or directory in a Unix-style file system, convert it to the simplified canonical path.

 In a Unix-style file system, a period '.' refers to the current directory, a double period '..' refers to the directory up a level, and any multiple consecutive slashes (i.e. '//') are treated as a single slash '/'. For this problem, any other format of periods such as '...' are treated as file/directory names.

 The canonical path should have the following format:

 The path starts with a single slash '/'.
 Any two directories are separated by a single slash '/'.
 The path does not end with a trailing '/'.
 The path only contains the directories on the path from the root directory to the target file or directory (i.e., no period '.' or double period '..')
 Return the simplified canonical path.

 Example 1:
 Input: path = "/home/"
 Output: "/home"
 Explanation: Note that there is no trailing slash after the last directory name.
 
 Example 2:
 Input: path = "/../"
 Output: "/"
 Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.
 
 Example 3:
 Input: path = "/home//foo/"
 Output: "/home/foo"
 Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.
 
 Example 4:
 Input: path = "/a/./b/../../c/"
 Output: "/c"
  
 Constraints:

 1 <= path.length <= 3000
 path consists of English letters, digits, period '.', slash '/' or '_'.
 path is a valid absolute Unix path.
 
 */
func simplifyPath(_ path: String) -> String {
    var pathCopy = ""
    var last: Character = "-"
    for s in path {
        if !(s == "/" && last == "/") {
            pathCopy += String(s)
        }
        last = s
    }
    if pathCopy.starts(with: "/") {
        pathCopy = String(pathCopy.suffix(pathCopy.count - 1))
    }
    if pathCopy.last == "/" {
        pathCopy = String(pathCopy.prefix(pathCopy.count - 1))
    }
    let folders = pathCopy.split(separator: "/")
    var outputFolders: [String] = []
    for i in 0 ..< folders.count {
        let folder = folders[i]
        if folder != "." {
            if folder == ".." {
                if !outputFolders.isEmpty {
                    outputFolders.removeLast()
                }
            } else {
                outputFolders.append(String(folder))
            }
        }
    }
    let output = outputFolders.joined(separator: "/")
    return "/\(output)"
}

let path = "/home/"
simplifyPath(path)

let path2 = "/../"
simplifyPath(path2)

let path3 = "/home//foo/"
simplifyPath(path3)

let path4 = "/a/./b/../../c/"
simplifyPath(path4)
