echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="bionic build/soong external/ant-wireless/ant_native hardware/qcom/bt system/core vendor/aosp"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply -v $rootdirectory/device/xiaomi/libra/patch-sets/$dir/*.patch
	echo " "
done
git apply -v $rootdirectory/device/xiaomi/libra/patch-sets/hardware/qcom/bt/symlink_8994_8992.patch

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
