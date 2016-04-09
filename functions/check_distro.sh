#!/bin/bash

check_distro_release (){
if [[ $(lsb_release -rs) != 16.04 ]]; then
  echo "sorry this script requires Ubuntu 16.04 LTS"
fi
}
