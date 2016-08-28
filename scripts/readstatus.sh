#!/bin/bash

readstatus(){
  watch -n1 dig elastic-node-1.compositecode.com
}

readstatus
