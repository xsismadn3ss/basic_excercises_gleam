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

pub type Tree {
  Empty
  Node(value: Int, left: Tree, right: Tree)
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
    Node(num, left, right) -> {
      case num == value {
        True -> True
        False -> {
          let left_search = contains(left, value:)
          let right_search = contains(right, value:)

          case left_search, right_search {
            _, True -> True
            True, _ -> True
            False, False -> False
          }
        }
      }
    }
  }
}
