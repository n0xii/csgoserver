mkdir server
cd server
mkdir csgo
cd csgo
csgodir=$(pwd)
cd ..
mkdir steamcmd
cd steamcmd
sudo apt-get install wget
wget http://security.ubuntu.com/ubuntu/pool/main/g/gcc-8/lib32gcc1_8.4.0-1ubuntu1~18.04_amd64.deb

sudo apt-get install lib32gcc1
wget  https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar zxvf steamcmd_linux.tar.gz
rm -r steamcmd_linux.tar.gz
./steamcmd.sh +quit
./steamcmd.sh +login anonymous +force_install_dir $csgodir +app_update 740 validate +quit
cd ..
cd csgo
echo './srcds_run -game csgo -port 27015 +maxplayers 8 +exec server.cfg +map de_dust2' > runcsgo.sh
chmod 777 runcsgo.sh
./runcsgo.sh
