data Tree a =
    Leaf | 
    Node a (Tree a) (Tree a)
    deriving Show

tree :: Tree Int
tree = (Node 3 (Node 4 Leaf (Node 5 Leaf Leaf)) Leaf)

leaf_size:: Tree a -> Int
leaf_size Leaf = 1
leaf_size (Node value left rigth) =
    (leaf_size left) + (leaf_size rigth)

main = print(leaf_size tree)

