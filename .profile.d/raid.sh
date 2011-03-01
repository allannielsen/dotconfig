function sdparm_down {
        sudo sdparm -C stop /dev/sdb && \
        sudo sdparm -C stop /dev/sdc && \
        sudo sdparm -C stop /dev/sdd && \
        sudo sdparm -C stop /dev/sde
}

function sdparm_up {
        sudo sdparm -C start /dev/sdb && \
        sudo sdparm -C start /dev/sdc && \
        sudo sdparm -C start /dev/sdd && \
        sudo sdparm -C start /dev/sde
}

function startraid {
        echo "Start raid"
        mounted=`mount | gawk 'BEGIN{found=0}/^\/dev\/mapper\/lsls/{found=1}END{print found}'`;
        if [ ! -b /dev/mapper/lsls ]; then
                sudo cryptsetup create lsls /dev/md0
        fi
        if [ "$mounted" = "1" ]; then
                sdparm_up
        else
                mount /mnt/md0
        fi
}

function stopraid {
        echo "Stop raid";
        mounted=`mount | gawk 'BEGIN{found=0}/^\/dev\/mapper\/lsls/{found=1}END{print found}'`;
        if [ "$mounted" = "1" ]; then
                cnt=`sudo lsof | grep /mnt/md0 | wc -l`
                if [ "$cnt" = "0" ]; then
                        sudo umount /mnt/md0
                        sleep 1
                else
                        echo "File system is in use:";
                        sudo lsof | grep /mnt/md0
                        return;
                fi
        fi
        sdparm_down;
        echo "end of function"
}
 
