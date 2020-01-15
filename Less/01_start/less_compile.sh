src_parh="src"
if [ "$1" != "" ]; then
	src_parh="$1"
fi

dist_parh="dist"
if [ "$2" != "" ]; then
	dist_parh="$2"
fi

for less_file in $(find $src_parh -name "*.less"); do
	css_file=$(echo $less_file | sed -E "s/$src_parh(.*\/)?([^/]+).less$/$dist_parh\1\2.css/")
	path_css_file=$(echo $css_file | sed -E 's/(.*)\/[^/]+.css$/\1/')
	# [ ! -d $path_css_file ] && mkdir -p $path_css_file
	if [ ! -d $path_css_file ]; then
		mkdir -p $path_css_file
	fi
	rm -f $css_file
	./node_modules/.bin/lessc $less_file > $css_file
done
