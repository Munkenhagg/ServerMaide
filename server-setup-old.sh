set -e
echo -en "do you wish to use [fabric/paper] "
read selection
selection="$(echo "$selection" | tr '[:upper:]' '[:lower:]')"
echo -en "do you wish to enable geyserMC and floodgate support?[y/N] "
read geyser
geyser="$(echo "$geyser" | tr '[:upper:]' '[:lower:]')"
case $selection in
	paper)
		mkdir -p paper/plugins
		echo "downloading paperMC ..."
		wget https://fill-data.papermc.io/v1/objects/7e8fd35b554aea8d1492c83fcf429e9c8e391464e50f82ee3e408be87b4e80df/paper-1.21.11-39.jar -O paper.jar
		echo "done."
		if [ "$geyser" = "y" ]; then
			echo "downloading geyser for spigot..."
			wget https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot -O geyser-spigot.jar
			echo "done."
			echo "downloading floodgate..."
			wget https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot -O floodgate-spigot.jar
			echo "done."
			echo "downloading viaversion due to geyser sometimes not working on 1.21.11 else..."
			wget https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/5.6.0/PAPER/ViaVersion-5.6.0.jar -O viaversion-paper.jar
			echo "done."
		fi
		mv paper.jar paper/
		mv geyser-spigot.jar paper/plugins
		mv floodgate-spigot.jar paper/plugins
		mv viaversion-paper.jar paper/plugins
		echo -e "Success!\nServer installed into $(pwd)/paper"
		echo "If running the server for the first time, you may have to <echo eula=true > eula.txt> after first run"
		exit 0
	;;
	fabric)
		echo "Downloading fabric..."
		wget https://meta.fabricmc.net/v2/versions/loader/1.21.11/0.18.3/1.1.0/server/jar -O fabric.jar
		echo "done."
		echo "downloading fabric-api..."
		wget https://cdn.modrinth.com/data/P7dR8mSH/versions/KhCFoeip/fabric-api-0.139.5%2B1.21.11.jar -O fabric-api.jar
		echo "done."
		if [ "$geyser" = "y" ]; then
			echo "downloading geyser..."
			wget https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/fabric -O fabric-geyser.jar
			echo "done."
			echo "downloading floodgate..."
			wget https://cdn.modrinth.com/data/bWrNNfkb/versions/QFAMeMNB/Floodgate-Fabric-2.2.6-b51.jar -O fabric-floodgate.jar
			echo "done."
			echo "downloading viaversion due to 1.21.11 with geyser sometimes not working else..."
			wget https://cdn.modrinth.com/data/YlKdE5VK/versions/jmsoyTm9/ViaFabric-0.4.21%2B129-main.jar -O viaversion-fabric.jar
			echo "done."
			echo "downloading hydraulic to support some mods(experimental)"
			wget https://download.geysermc.org/v2/projects/hydraulic/versions/latest/builds/latest/downloads/fabric -O hydraulic.jar
			echo "finished."
		fi
		mkdir -p fabric/mods
		mv fabric-floodgate.jar fabric/mods
		mv fabric-geyser.jar fabric/mods
		mv fabric.jar fabric
		mv fabric-api.jar fabric/mods
		mv viaversion-fabric.jar fabric/mods
		mv hydraulic.jar fabric/mods
		echo -e "Successfully installed server into $(pwd)/fabric\nPlease complete fabric's built-in setup at fabric/fabric.jar"
		echo "after first run of the server you may need to agree to the eula"
	;;
esac
