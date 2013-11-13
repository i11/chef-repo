name "web"
description "The base role for mysql database systems"
run_list "role[base]",
         "recipe[mysql::server]"
