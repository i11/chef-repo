name "base"
description "The base role for all managed systems"
run_list "recipe[package_installer]"

default_attributes({
  "package_installer" => {
    "packages" => {
      "htop" => nil
    }
  }
})
