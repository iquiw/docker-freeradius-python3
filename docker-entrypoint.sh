#! /bin/sh

python3_file=/etc/freeradius/3.0/mods-enabled/python3

generate_python3() {
	{
		echo 'python3 {'
		echo "	python_path=\"${FREERADIUS_PYTHON3_PATH:-\${modconfdir\}/\${.:name\}}\""
		echo "	module = ${FREERADIUS_PYTHON3_MODULE:-example}"
		if [ -n "$FREERADIUS_PYTHON3_PASS_ALL_VPS" ]; then
			echo "	pass_all_vps = $FREERADIUS_PYTHON3_PASS_ALL_VPS"
		fi
		if [ -n "$FREERADIUS_PYTHON3_PASS_ALL_VPS_DICT" ]; then
			echo "	pass_all_vps_dict = $FREERADIUS_PYTHON3_PASS_ALL_VPS_DICT"
		fi
		for callback in ${FREERADIUS_PYTHON3_CALLBACKS}; do
			echo "	mod_$callback = \${.module}"
			echo "	func_$callback = $callback"
		done
		echo '}'
	} > "$python3_file"
	chmod 640 "$python3_file"
}

generate_python3

exec "$@"
