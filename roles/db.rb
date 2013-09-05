name "web"
description "The base role for mysql database systems"
run_list "role[base]",
         "recipe[mysql::server]"

default_attributes({
  "mysql" => {
    "bind_address" => "0.0.0.0",
    "server_debian_password" => "xS5cFQu4",
    "server_root_password" => "NpaVKuQL",
    "server_repl_password" => "SxfFC4bJ"
  }
})
