#!/bin/bash

tar --exclude=$HOME/.cache --exclude=$HOME/.local --exclude=$HOME/snap --exclude=$HOME/.mozilla --exclude=node_modules --exclude=$HOME/backup -zcvpf /tmp/backup-$USER.tar.gz $HOME

mv /tmp/backup-$USER.tar.gz /$HOME/backup/backup-$HOSTNAME-$USER-$(date +%Y-%m-%d).tar.gz
ls -lh $HOME/backup
