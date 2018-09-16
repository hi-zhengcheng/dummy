set -ex

create_dir(){
	local target_dir=$1
	if [ ! -d ${target_dir} ]
	then
		mkdir -p ${target_dir}
	fi
}

download(){
	local target_dir=$1
	local url=$2
	local cut_dirs=$3
	local cur_dir=$(pwd)

	create_dir ${target_dir}
	cd ${target_dir}
	wget -r -np -nH --cut-dirs=${cut_dirs} -A '*.png' ${url}

	if [ -f robots.txt.tmp ]
	then
		rm robots.txt.tmp
	fi

	cd ${cur_dir}
}

scenes="Aloe Baby1 Baby2 Baby3 Bowling1 Bowling2 Cloth1 Cloth2 Cloth3 Cloth4 Flowerpots Lampshade1 Lampshade2 Midd1 Midd2 Monopoly Plastic Rocks1 Rocks2 Wood1 Wood2"
resolutions="Full Half Third"

resolution="Third"
download raw_data/scenes2006 http://vision.middlebury.edu/stereo/data/scenes2006/${resolution}Size/ 4
