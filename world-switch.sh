read -p "What server do you wish to switch the active world for " server
server="$(echo "$server" | tr '[:upper:]' '[:lower:]')"
if [ ! -d "$(dirname $0)/$server" ]; then
	echo "Error: No such server"
	exit 1
fi

read -p "Enter the world name(case-sensitive) " world

if [ -d "$server/$world" ]; then
	echo "changing..."
	sed -i "s/^level-name=.*/level-name=$world/" "$server/server.properties"
else
	echo -e "adding new world '$world'"
	sed -i "s/^level-name=.*/level-name=$world/" "$server/server.properties"
fi
