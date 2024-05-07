#!/bin/bash

# Task 1: Find the latest version
latest_version_with_slash=$(ls -d */ | sort -V | tail -n 1)
echo "Latest version found: $latest_version_with_slash"
latest_version=${latest_version_with_slash%?}
echo "Latest version found: $latest_version"
ls
# Task 2: Get the name of the .bar file inside the latest version folder
bar_file=$(find "$latest_version" -type f -name "*.bar")
echo "BAR file found: $bar_file"

# Task 3: Create the URL
url="https://github.com/aleiamp/customer_delete_GDPR/raw/main/$bar_file"
echo "URL created: $url"

# Task 4: Modify the YAML file
yaml_file="bar.yaml"

# Modify the YAML file using sed
sed -i  "s|barURL:.*|barURL:\n    - $url|g" "$yaml_file"

echo "YAML file modified with new URL:"
cat "$yaml_file"
