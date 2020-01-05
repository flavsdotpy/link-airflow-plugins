#!/bin/bash

PythonHome=${AIRFLOW_HOME//\/airflow/}

echo -e "\033[1;33mWelcome!\033[0m Let's prepare your airflow to accept your plugins locally!"

echo "-------------------------------------------------------------------------------"
echo "Enter plugin name: "
read PluginName

echo "-------------------------------------------------------------------------------"
echo "Enter plugin location: "
read PluginFolder

echo "-------------------------------------------------------------------------------"
echo -e "Enter the modules you want to load \e[36m(separated by commas Ex.: hooks,operators): \033[0m"
read NecessaryLinks

echo "-------------------------------------------------------------------------------"	
for Type in "hooks" "operators" "executors" "macros" "migrations" "models" "sensors"
	do
		if [[ "$NecessaryLinks" == *"$Type"* ]]
		then
			echo -e "Creating link for \e[92m$Type\033[0m"
			ln -s "$PluginFolder/$PluginName/$Type"  "$AIRFLOW_HOME/$Type/$PluginName"
		fi
	done

ln -s "$PluginFolder/$PluginName" "$PythonHome/$PluginName" 
echo -e "\e[92mSuccessfully\033[0m finished creating links..."
