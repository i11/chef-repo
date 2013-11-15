name "web"
description "The base role for systems that serve HTTP traffic"
run_list "role[base]",
         "recipe[java]",
         "recipe[nginx]",
         "recipe[profile-testgang]"

default_attributes({
  "java" => {
    "oracle" => {
      "accept_oracle_download_terms" => true
    },
    "accept_license_agreement" => true,
    "install_flavor" => "oracle",
    "jdk_version" => 7
  },
  "nginx" => {
    "default_site_enabled" => false,
    "client_max_body_size" => '1024M'
  }
})
