type Str_tuple = (String,Int)

map_input_create_tupple:: [String] -> [Str_tuple]
map_input_create_tupple [] = []
map_input_create_tupple strings = 
    map(\str -> (str, length str)) strings

filter_tupple_string_list:: [Str_tuple] -> Int -> [Str_tuple]
filter_tupple_string_list [] limit = []
filter_tupple_string_list ((str,len):tuple_string_ls_tail) limit =
    if len > limit
        then (str,len) : (filter_tupple_string_list tuple_string_ls_tail limit)
        else (filter_tupple_string_list tuple_string_ls_tail limit)
    

--main = print(filter_tupple_string_list (map_input_create_tupple ["ali","nedaaee","oskooee","seyyed"]) 5)

--main = print(filter_tupple_string_list (map_input_create_tupple ["123", "1234", "12", "12345"]) 1)
--main = print(filter_tupple_string_list (map_input_create_tupple ["123", "1234", "12", "12345"]) 3)
main = print(filter_tupple_string_list (map_input_create_tupple ["123", "1234", "12", "12345"]) 5)