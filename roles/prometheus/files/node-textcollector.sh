#!/bin/bash

# Atomic write for prometheus node exporter
/usr/local/bin/arch-textcollector.sh > {{ prometheus_textfile_dir}}/pacman.prom.$$
mv {{ prometheus_textfile_dir }}/pacman.prom.$$ {{ prometheus_textfile_dir }}/pacman.prom
