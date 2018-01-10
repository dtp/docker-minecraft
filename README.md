# Minecraft server for Docker
Containerized Minecraft server that runs on Debian Slim

## Available tags and Dockerfiles
-	[`vanilla`, `latest`, (*vanilla/Dockerfile*)](https://github.com/dtp/docker-minecraft/blob/master/vanilla/Dockerfile)
-	[`forge`, (*forge/Dockerfile*)](https://github.com/dtp/docker-minecraft/blob/master/forge/Dockerfile)
-	[`paper`, (*vanilla/Dockerfile*)](https://github.com/dtp/docker-minecraft/blob/master/paper/Dockerfile)
-	[`spigot`, (*vanilla/Dockerfile*)](https://github.com/dtp/docker-minecraft/blob/master/spigot/Dockerfile)
-	[`craftbukkit`, (*vanilla/Dockerfile*)](https://github.com/dtp/docker-minecraft/blob/master/craftbukkit/Dockerfile)

## Using this image
### Starting the server
Start a detached instance with port 25565 bound to the host (the default
minecraft port), where /path/to/minecraft is the path to the minecraft server
directory.
```console
$ docker run -itd --name minecraft -p 25565:25565 -v /path/to/minecraft:/data cmstar/minecraft
```
By default, the container will download and run the latest release version of
Minecraft. To use a different version, set the `VERSION` environmental variable.
```console
$ docker run -itd --name minecraft -e VERSION="1.10.2" -p 25565:25565 -v /path/to/minecraft:/data cmstar/minecraft
```
Additionally, to use RCON (when enabled in `server.properties`), simply bind
port 25575.
```console
$ docker run -itd --name minecraft -p 25565:25565 -p 25575:25575 -v /path/to/minecraft:/data cmstar/minecraft
```
To customize the Java Virtual Machine (JVM) arguments, pass them as arguments
after specifying the container image.
```console
$ docker run -itd --name minecraft -p 25565:25565 -v /path/to/minecraft:/data cmstar/minecraft -Xms512M -Xmx1G
```
### Using the Forge image
Starting a simple Forge server is similar to vanilla.
```console
$ docker run -itd --name minecraft -e VERSION="1.10.2-recommended" -p 25565:25565 -v /path/to/minecraft:/data cmstar/minecraft
```
To load a (zipped) Curse modpack, where `modpack.zip` is the path to modpack in
`/path/to/minecraft`.
```console
$ docker run -itd --name minecraft -e VERSION="1.10.2-recommended" -e MODPACK="modpack.zip" -p 25565:25565 -v /path/to/minecraft:/data cmstar/minecraft
```
Alternatively, load a (zipped) Curse modpack from a URL.
```console
$ docker run -itd --name minecraft -e VERSION="1.10.2-recommended" -e MODPACK="https://example.com/modpack.zip" -p 25565:25565 -v /path/to/minecraft:/data cmstar/minecraft
```
### Accessing the server's TTY
```console
$ docker attach minecraft
```

## Notes
This container is fully compliant with the Minecraft End User License Agreement
(EULA).
It does not contain any code or JARs distributed by Mojang, and is instead
downloaded at runtime. For more information about Minecraft's EULA, please refer
to https://account.mojang.com/documents/minecraft_eula.

Minecraft&reg; is a registered trademark of Mojang AB.
