import Foundation
import GitBranchCleaner

@_cdecl("findBranchesToCleanup")
public func findBranchesToCleanup(
  projectRoot: UnsafePointer<CChar>,
  branchMaxDepth: Int32,
  refBranchName: UnsafePointer<CChar>
) -> UnsafeMutablePointer<CChar>? {
  runCatching {
    let config = GitBranchCleanerConfig(
      branchMaxDepth: Int(branchMaxDepth),
      refBranchName: String(cString: refBranchName)
    )
    let cleaner = GitBranchCleaner(projectRoot: String(cString: projectRoot))
    return try cleaner.findBranchesToCleanup(config: config)
  }
}

@_cdecl("cleanupBranches")
public func cleanupBranches(
  projectRoot: UnsafePointer<CChar>,
  branchList: UnsafePointer<CChar>
) -> UnsafeMutablePointer<CChar>? {
  runCatching {
    let branches = try decode(from: branchList, into: [Branch].self)
    let cleaner = GitBranchCleaner(projectRoot: String(cString: projectRoot))
    try cleaner.cleanupBranches(branches: branches)
  }
}