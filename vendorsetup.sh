#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2025 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="macan"

# Explicitly select this tree; merely sourcing every vendorsetup must not
# replace another device's AERA settings. See README for the build command.

if [ "${1:-}" = "$FDEVICE" ] || [ "${AERA_BUILD_DEVICE:-}" = "$FDEVICE" ]; then
	export AERA_BUILD_DEVICE=macan
	export LC_ALL="C"
	export AERA_AB_DEVICE=1
	export AERA_USE_TAR_BINARY=1
	export AERA_USE_SED_BINARY=1
	export AERA_USE_LZ4_BINARY=1
	export AERA_USE_ZSTD_BINARY=1
	export AERA_USE_DATE_BINARY=1
	export AERA_VANILLA_BUILD=1
	export AERA_PRODUCT_PREFIX=AERA
	export AERA_BUILD_STATUS=Official
	export AERA_BUILD_TYPE=Beta
	export AERA_USE_GREP_BINARY=1
	export AERA_USE_BUSYBOX_BINARY=1
	export AERA_USE_XZ_UTILS=1
	export AERA_VIRTUAL_AB_DEVICE=1
	export AERA_ALLOW_EARLY_SETTINGS_LOAD=1
	export AERA_USE_UPDATED_MAGISKBOOT=1
	export AERA_USE_FSCK_EROFS_BINARY=1
	export AERA_USE_PATCHELF_BINARY=1
	export AERA_SETTINGS_ROOT_DIRECTORY=/data/recovery
	export AERA_MISCELLANEOUS_ROOT_DIRECTORY=/sdcard

	# For OnePlus 15R/ACE6T
	export TARGET_DEVICE_ALT="PLR110,CPH2767,CPH2769,CPH2771,OP6117L1,OP612DL1"
	export AERA_TARGET_DEVICES="$TARGET_DEVICE_ALT"
        export AERA_USE_DMSETUP=1
	export AERA_ENABLE_ROOT_MANAGER=1
	unset AERA_MAINTAINER_PATCH_VERSION
fi
#
