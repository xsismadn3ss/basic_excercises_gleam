import level4/ex12.{
  Empty, LongestPath, Node, ShortestPath, contains, max_depth, path_by_weight,
  prune_path, size, sum,
}

pub fn ex12_test() {
  // Arbol:
  //     1
  //   /  \
  //  2   3
  // 

  let tree = Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty))

  assert size(tree:) == 3
  assert sum(tree:) == 6
  assert contains(tree:, value: 3) == True
  assert max_depth(tree:) == 2

  //
  //      1
  //     / \
  //    2   1
  //   / \
  //  4  Empty
  //
  //

  let tree =
    Node(1, Node(2, Node(4, Empty, Empty), Empty), Node(1, Empty, Empty))

  assert max_depth(tree:) == 3

  let longest_path_w = path_by_weight(tree, LongestPath)
  assert longest_path_w == 7

  let shortest_path_w = path_by_weight(tree, ShortestPath)
  assert shortest_path_w == 2

  let shortest_path = prune_path(tree:, path: ShortestPath)
  assert shortest_path == Node(1, Empty, Node(1, Empty, Empty))

  let longest_path = prune_path(tree:, path: LongestPath)
  assert longest_path == Node(1, Node(2, Node(4, Empty, Empty), Empty), Empty)
}
