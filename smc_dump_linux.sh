#!/bin/bash

i=0
max=$(cat /sys/bus/platform/drivers/applesmc/applesmc.768/key_count)

while [ $i -lt $max ] ; do
	echo $i > /sys/bus/platform/drivers/applesmc/applesmc.768/key_at_index ; sleep 0.01
	keyname=$(cat /sys/bus/platform/drivers/applesmc/applesmc.768/key_at_index_name) ; sleep 0.01
	keytype=$(cat /sys/bus/platform/drivers/applesmc/applesmc.768/key_at_index_type) ; sleep 0.01
	keydata=$(cat /sys/bus/platform/drivers/applesmc/applesmc.768/key_at_index_data | xxd -c 32 -g 1 -p)
	echo "  $keyname  [$keytype]  $keydata"
	i=$(($i+1))
done
