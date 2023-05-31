# OpenImageIO #

## intro ##

Prebuilt OpenImageIO for standalone command line and python tools. __Not made for C++ development!__

## install ##

If you want the precomplied x64 Windows version, get the latest [release](https://github.com/pitvfx/OpenImageIO/releases/tag/v1.0.0).
Unzip it and your done.

If you want the install bat to build and install yourself:
````
curl -o oiio_install_x64-win.bat https://raw.githubusercontent.com/pitvfx/OpenImageIO/master/oiio_install_x64-win.bat
````
run the oiio_install_x64-win.bat once everything is done, you should have a oiio_install_x64-win and a OpenImageIO folder. The OpenImageIO folder is the actual root directory, you can copy it to your system and work with it. The oiio_install_x64-win folder you can either keep, archive or delete it.

## usage ##

The only really important step is that you always start with the OpenImageIO.bat from the OpenImageIO folder you've either unziped or created in the previous [install section](#install). From there on out, all environment variables are set correctly and you can use tools, like oiiotool or iconvert, from the commandline. You can also use the python3 compiler to start a python session. Just import oiio and numpy and go crazy.

