echo "playit.gg installation"
mkdir playit-binary
case $(uname -m) in
	x86_64)
		wget https://github.com/playit-cloud/playit-agent/releases/download/v0.16.5/playit-linux-amd64 -O playit
	;;
	aarch64)
		wget https://github.com/playit-cloud/playit-agent/releases/download/v0.16.5/playit-linux-aarch64 -O playit
	;;
	armv7l)
		wget https://github.com/playit-cloud/playit-agent/releases/download/v0.16.5/playit-linux-armv7 -O playit
	;;
	i686)
		wget https://github.com/playit-cloud/playit-agent/releases/download/v0.16.5/playit-linux-i686 -O playit
	;;
esac
mv playit playit-binary
chmod +x playit-binary/playit || sudo chmod +x playit-binary/playit
