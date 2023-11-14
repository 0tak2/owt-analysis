#!/bin/sh

## NVM Load
. /root/.bashrc

## INIT
/owt-server/dist/bin/init-all.sh --deps

## RUN Daemons
/owt-server/dist/bin/start-all.sh

## LOG (app)
tail -f /owt-server/dist/logs/app.stdout