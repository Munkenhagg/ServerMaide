echo -en "Please choose the server type to install[paper/fabric]: "
read servertype
servertype=$(echo -e "$servertype" | tr '[:upper:]' '[:lower:]')
echo -en "Do you wish to use Geyser and floodgate to allow bedrock edition players to connect to the server?"
read geyseryn
if [ ! "$servertype" = "paper" ] && [ ! "$servertype" = "fabric" ]; then
	echo "Not a valid server!"
	exit 1
fi
D="$(cd "$(dirname "$0")" && pwd)"
main="$(jq -r ".${servertype}.main" $D/links.json)"
if [ "$geyseryn" = "y" ]; then
	geyser="$(jq -r ".${servertype}.geyser" $D/links.json)"
	floodgate="$(jq -r ".${servertype}.floodgate" $D/links.json)"
fi
echo -en "Please choose the server root: "
read root
wget "$main" -O "$root/$servertype.jar"
if [ "$geyseryn" = "y" ]; then
	local M
	case servertype in
		paper) M=plugins ;;
		fabric) M=mods ;;
	esac
	wget "$geyser" -O "$root/$M/Geyser-${servertype}.jar"
	wget "$floodgate" -O "$root/$M/Floodgate-${servertype}.jar"
fi

echo "Done installing server."
echo "eula=true" > "$root/eula.txt"
