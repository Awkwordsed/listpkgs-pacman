#!/usr/bin/env bash

echo "pkg name, $pkgname"
read pkgname

echo "what are the similarity with other packages, $smls"
read smls

sudo pacman -Ss $pkgname | grep $smls | awk '{print $1}' > package_list.txt

sed -i 's/^core\///g' package_list.txt
sed -i 's/^extra\///g' package_list.txt
sed -i 's/^multilib\///g' package_list.txt

sudo pacman -S - <  package_list.txt
