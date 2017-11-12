echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="external/ant-wireless/ant_native hardware/qcom/bt"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Reverting $dir patches..."
	#git apply --reverse $rootdirectory/device/LeEco/X3/patches/$dir/*.patch
	git reset --hard
	git clean -f -d
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
