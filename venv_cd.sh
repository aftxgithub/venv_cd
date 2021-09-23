_venv_cd() {
	builtin cd $@	# do actual directory change
	for dir in */	# walk top-level dirs
	do
		dir=${dir%*/} # remove trailing '/'
		if [ -f "$dir/bin/activate" ]
		then
			# source the virtual environment
			echo "Environment found in '$dir', sourcing..."
			. $dir/bin/activate
		fi
	done
}

alias cd=_venv_cd
