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


rigth_subtree_count :: Tree a -> Int
rigth_subtree_count Leaf = 0  
rigth_subtree_count (Node _ left right) = 
    1 + tree_size right

left_subtree_count :: Tree a -> Int
left_subtree_count Leaf = 0  
left_subtree_count (Node _ left right) = 
    1 + tree_size left


main = print(rigth_subtree_count tree)