echo "Enter the server name(Case sensitive): "
read S
echo "Enter the World name to switch to"
read WN
sed -i "s/^level-name=.*/level-name=$WN/" "$S/server.properties"
