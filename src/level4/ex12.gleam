//// Árbol binario muy básico
//// type Tree {
////    Empty
////    Node(value: Int, left: Tree, right: Tree)
////  }
//// 
//// Implementa:
////  size(tree) -> Int
////  sum(tree) -> Int
////  contains(tree, value) -> Bool

import gleam/int
import gleam/option.{type Option, None, Some}

pub type Tree {
  Empty
  Node(value: Int, left: Tree, right: Tree)
}

pub fn example_tree() -> Tree {
  //
  //      3
  //     / \
  //    10   5
  //   / \   \
  //  4   16  Empty
  // 
  // Suma:          38
  // Tamaño:        5
  // Maximo:        16
  // Minimo:        4
  // Profundidad:   3
  // Camino corto:  3 -> 5
  // Camino largo:  3 -> 10 -> 16  
  Node(
    3,
    Node(10, Node(4, Empty, Empty), Node(16, Empty, Empty)),
    Node(5, Empty, Empty),
  )
}

pub fn size(tree tree: Tree) -> Int {
  case tree {
    Empty -> 0
    Node(_, left, right) -> {
      let left_size = size(left)
      let right_size = size(right)

      1 + left_size + right_size
    }
  }
}

pub fn sum(tree tree: Tree) -> Int {
  case tree {
    Empty -> 0
    Node(value, left, right) -> {
      let left_sum = sum(left)
      let right_sum = sum(right)

      value + left_sum + right_sum
    }
  }
}

pub fn contains(tree tree: Tree, value value: Int) -> Bool {
  case tree {
    Empty -> False
    Node(target, left, right) -> {
      target == value || contains(left, value:) || contains(right, value:)
    }
  }
}

pub fn max_depth(tree tree: Tree) -> Int {
  case tree {
    Empty -> 0
    Node(_, left, right) -> {
      let left_depth = max_depth(left)
      let right_depth = max_depth(right)

      1 + int.max(left_depth, right_depth)
    }
  }
}

pub fn max_value(tree tree: Tree) -> Option(Int) {
  case tree {
    Empty -> None
    Node(value, left, right) -> {
      let left_max = max_value(left)
      let right_max = max_value(right)

      let max_so_far = case left_max {
        None -> value
        Some(l_max) -> int.max(value, l_max)
      }

      let final_max = case right_max {
        None -> value
        Some(r_max) -> int.max(max_so_far, r_max)
      }

      Some(final_max)
    }
  }
}

pub fn min_value(tree tree: Tree) -> Option(Int) {
  case tree {
    Empty -> None
    Node(value, left, right) -> {
      let left_max = min_value(left)
      let right_max = min_value(right)

      let max_so_far = case left_max {
        None -> value
        Some(l_max) -> int.min(value, l_max)
      }

      let final_max = case right_max {
        None -> value
        Some(r_max) -> int.min(max_so_far, r_max)
      }

      Some(final_max)
    }
  }
}

pub type PathType {
  ShortestPath
  LongestPath
}

/// Calcular el peso de un camino
/// Se puede aplicar para caminos cortos y largos
pub fn path_by_weight(tree tree: Tree, path path: PathType) {
  case tree {
    Empty -> 0
    Node(value, Empty, Empty) -> value
    Node(value, Empty, right) -> value + path_by_weight(right, path)
    Node(value, left, Empty) -> value + path_by_weight(left, path)
    Node(value, left, right) -> {
      let lw = path_by_weight(left, path)
      let rw = path_by_weight(right, path)

      case path, lw <= rw, lw >= rw {
        ShortestPath, True, _ -> value + lw
        ShortestPath, False, _ -> value + rw
        LongestPath, _, True -> value + lw
        LongestPath, _, False -> value + rw
      }
    }
  }
}

pub fn prune_path(tree tree: Tree, path path: PathType) {
  case tree {
    // Si esta vacio no hay nada que devolver
    Empty -> Empty
    // Si ya no tiene mas nodos, se retornoa el nodo actual
    Node(value, Empty, Empty) -> Node(value, Empty, Empty)

    // Si un lado esta vacio, el unico camino posible es el que no lo esta
    Node(value, Empty, right) -> Node(value, Empty, prune_path(right, path:))
    Node(value, left, Empty) -> Node(value, prune_path(left, path:), Empty)

    // Si en ambos lados tienen ramas, hay que recortarlas
    Node(value, left, right) -> {
      let lw = path_by_weight(left, path:)
      let rw = path_by_weight(right, path:)

      case path, lw <= rw, lw >= rw {
        ShortestPath, True, _ -> Node(value, prune_path(left, path:), Empty)
        ShortestPath, False, _ -> Node(value, Empty, prune_path(right, path:))
        LongestPath, _, True -> Node(value, prune_path(left, path:), Empty)
        LongestPath, _, False -> Node(value, Empty, prune_path(right, path:))
      }
    }
  }
}
