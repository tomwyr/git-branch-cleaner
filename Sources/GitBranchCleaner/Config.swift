public struct GitBranchCleanerConfig {
  let branchMaxDepth: Int
  let refBranchName: String
  let refBranchType: BranchType
  let mergeStrategy: BranchMergeStrategy
  let mergeMatchers: [BranchMergeMatcher]

  public init(
    branchMaxDepth: Int = 100,
    refBranchName: String = "main",
    refBranchType: BranchType = .local,
    mergeStrategy: BranchMergeStrategy = .squashAndMerge,
    branchMergeMatchers: [BranchMergeMatcher] = [
      .defaultMergeMessage,
      .branchNamePrefix,
      .squashedCommitsMessage,
      .identicalHistory,
    ]
  ) {
    self.branchMaxDepth = branchMaxDepth
    self.refBranchName = refBranchName
    self.refBranchType = refBranchType
    self.mergeStrategy = mergeStrategy
    self.mergeMatchers = branchMergeMatchers
  }
}
