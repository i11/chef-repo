name "web"
description "The base role for systems that serve HTTP traffic"
run_list "role[base]",
         "recipe[tomcat]"

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
    "base_version" => 7
  }
})
