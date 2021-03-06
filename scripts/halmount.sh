#!/bin/bash
#/* vim:set tabstop=4 textwidth=80 shiftwidth=4 expandtab cindent cino=(0,ml,\:0:
# * ( settings from: from: http://goanna.cs.rmit.edu.au/~nml/conventions.html )
# */
#
#/**********************************************************************
#    HalMount/HalUMount
#    Copyright (C) 2009 DaTaPaX
#
#    This program is free software; you can redistribute it and/or
#    modify it under the terms of the GNU General Public License
#    version 2 ONLY, as published by the Free Software Foundation.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program, in the file COPYING or COPYING.txt; if
#    not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
# **********************************************************************/

# halmount/halumount
#-------------
# Mounts and unmounts using hal (via dbus)
#
# More info:
#   http://people.freedesktop.org/~david/hal-spec/hal-spec.html

# ToDo
#   * Read in defaults for help display from Hal

# Version
APP_VER="0.21"

# Program name
PROG="$(basename ${0})"
MOUNTNAME="halmount"
UMOUNTNAME="halumount"

# Default FS type
FSTYPE=""

# Default mount options
OPTIONS=""

# Default Destination directory
DESTDIR=""

# Default to listing devices
LIST=0

function usage {
    echo -e "\
HalMount/HalUMount v${APP_VER}\n\
\n\
HalMount mounts and unmounts using hal (via dbus)\n\
\n\
Usage: ${PROG} -h|--help\n\
       ${MOUNTNAME} -l\n\
       ${MOUNTNAME} [-t FSTYPE] [-o OPTIONS] DEVICE [DESTDIR]\n\
       ${UMOUNTNAME} -l\n\
       ${UMOUNTNAME} [-o OPTIONS] DEVICE|DESTDIR\n\
\n\
-h|--help           - Displays this help\n\
-l                  - List available devices for mounting/unmounting\n\
-t FSTYPE           - Filesystem type (default: auto)\n\
-o OPTIONS          - Mount options (default: ?)\n\
DEVICE              - Device to mount (eg: /dev/sdb1)\n\
DESTDIR             - Destination mount directory (in /media, default: ?)\n\
Example: ${MOUNTNAME} /dev/sdb1\n\
Output:  Mounted /dev/sdb1 to /media/disk
"
}

while [ ${#} -gt 0 ]; do
    if [ "${1}" == "-h" ] || [ "${1}" == "--help" ]; then
        # Help
        usage
        exit 0
    elif [ "${1}" == "-l" ]; then
        # List
        shift
        LIST=1

        # assume options are finished
        break
    elif [ "${PROG}" == "${MOUNTNAME}" ] && [ "${1}" == "-t" ]; then
        # Type
        shift
        FSTYPE="${1}"
    elif [ "${1}" == "-o" ]; then
        # Options
        shift
        OPTIONS="${1}"
    else
        # Other

        # assume options are finished
        break
    fi
done

# If listing, no mount point or destination directory will be accepted
if [ ${LIST} -eq 0 ]; then
    DEVICE="${1}"
    shift

    if [ "${PROG}" == "${MOUNTNAME}" ]; then
        DESTDIR="${1}"
        shift
    fi
fi

if [ "${#}" -ne 0 ]; then
    echo "ERROR: Too many parameters specified: ${@}" >&2
    exit 1
fi

if [ ${LIST} -ne 0 ]; then
    # List devices
    hal-find-by-property --key info.category --string volume|\
            while read udi; do
        mounted="$(hal-get-property --udi ${udi} --key volume.is_mounted)"
        if [ "${PROG}" == "${MOUNTNAME}" ] && [ "${mounted}" == "false" ]; then
            # If we are looking to mount, and this dev isn't mounted
            echo "$(hal-get-property --udi ${udi} --key block.device)"
        elif [ "${PROG}" == "${UMOUNTNAME}" ] && [ "${mounted}" == "true" ]; then
            # If we are looking to unmount, and this dev is mounted
            echo "$(hal-get-property --udi ${udi} --key block.device) $(hal-get-property --udi ${udi} --key volume.mount_point)"
        fi
    done

    exit 0
fi

if [ "${DEVICE}" == "" ]; then
    echo "ERROR: No device specified" >&2
    exit 2
fi

# Retrieve the UDI for this device
udi="$(hal-find-by-property --key block.device --string "${DEVICE}")"

# First, check if it's a destination dir (for unmounting)
if [ "${udi}" == "" ] && [ "${PROG}" == "${UMOUNTNAME}" ]; then
    # mount_point does not contain a trailing slash
    DESTDIR="${DEVICE}"
    if [ "${DESTDIR: -1:1}" == "/" ]; then
        DESTDIR="${DESTDIR:0:$((${#DESTDIR} - 1))}"
    fi

    udi="$(hal-find-by-property --key volume.mount_point --string "${DESTDIR}")"
fi

# No d(ev)ice!
if [ "${udi}" == "" ]; then
    echo "ERROR: Couldn't find device in Hal" >&2
    exit 3
fi

# Get the mounted status of this udi
mounted="$(hal-get-property --udi $udi --key volume.is_mounted)"

if [ "${PROG}" == "${MOUNTNAME}" ]; then
    # Mounting
    if [ "${mounted}" == "true" ]; then
        # Already mounted
        echo "Device ${DEVICE} already mounted on $(hal-get-property --udi $udi --key volume.mount_point)"
        exit 4
    fi

    # NOTE: --print-reply req'd for blocking
    dbus-send --system --print-reply --dest=org.freedesktop.Hal \
            ${udi} \
            org.freedesktop.Hal.Device.Volume.Mount \
            string:"${DESTDIR}" \
            string:"${FSTYPE}" \
            array:string:"${OPTIONS}" >/dev/null
    ret=$?
    if [ ${ret} -ne 0 ]; then
        echo "ERROR: dbus-send failed" >&2
        exit $ret
    fi

    if [ "${DESTDIR}" == "" ]; then
        echo "Mounted ${DEVICE} to $(hal-get-property --udi ${udi} --key volume.mount_point)"
    fi
else
    # Unmounting

    if [ "${mounted}" == "false" ]; then
        # Not mounted
        echo "Device ${DEVICE} is not currently mounted"
        exit 4
    fi

    # NOTE: --print-reply req'd for blocking
    dbus-send --system --print-reply --dest=org.freedesktop.Hal \
            ${udi} \
            org.freedesktop.Hal.Device.Volume.Unmount \
            array:string:"${OPTIONS}" >/dev/null
    ret=$?
    if [ ${ret} -ne 0 ]; then
        echo "ERROR: dbus-send failed" >&2
        exit $ret
    fi
fi
