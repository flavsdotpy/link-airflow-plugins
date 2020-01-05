# link-airflow-plugins

This repository helds a simple shell script meant for linking custom Airflow plugins repositories to local Python and Airflow paths simulating the way it works in a production Airflow environment.

## Prerequisites

You need to set an environment variable:

`export AIRFLOW_HOME=/home/<USERNAME>/.local/lib/<PYTHON_FOLDER>/site-packages/airflow`

## How to use it?

Just run the script:

`bash link.sh`

It will ask you for 3 informations:

* The name of your plugin (Ex.: my_plugin)
* The full path for your plugin repository folder (Ex.: /home/ap3x/projects/my-plugin-repository)
* The modules from your plugin that you want to link (Ex.: hooks,operators)

After answering them, your plugin will be ready to use.
One good advantage of using this strategy is that, everytime you update your plugin (manually and/or by pulling commits), it will be instantly updated in the python path.
