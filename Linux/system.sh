#!/bin/bash
free -h > ~/backups/freemem/free_mem.txt
du -h  > ~/backups/diskuse/disk_usage.txt
lsof > ~/backups/openlist/open_list.txt
df -a -h > ~/backups/freedisk/free_disk.txt