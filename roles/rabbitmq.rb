name "web"
description "The base role for systems that serve HTTP traffic"
run_list "role[base]",
         "recipe[rabbitmq]",
         "recipe[rabbitmq::plugin_management]"

default_attributes({
  "rabbitmq" => {
    "enabled_plugins" => [
      "rabbitmq_management"
    ]
  }
})
