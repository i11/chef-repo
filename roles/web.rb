name "web"
description "The base role for systems that serve HTTP traffic"
run_list "role[base]",
         "recipe[tomcat]",
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
  "tomcat" => {
    "base_version" => 7,
    "bind_address" => "127.0.0.1"
  },
  "nginx" => {
    "default_site_enabled" => false
  }
})
