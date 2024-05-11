data Tree a =
    Leaf | 
    Node a (Tree a) (Tree a)
    deriving Show

tree :: Tree Int
tree = (Node 3 (Node 4 Leaf (Node 5 Leaf Leaf)) Leaf)

tree_size:: Tree a -> Int
tree_size Leaf = 1
tree_size (Node value left rigth) =
    1 + (tree_size left) + (tree_size rigth)

main = print(tree_size tree)



