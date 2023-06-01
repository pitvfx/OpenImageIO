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
Run the oiio_install_x64-win.bat and once everything is done, you should have a oiio_install_x64-win and a OpenImageIO folder. The OpenImageIO folder is the actual root directory, you can copy it to your system and work with it. The oiio_install_x64-win folder you can either keep, archive or delete it.

## usage ##

The only really important step is that you always start with the OpenImageIO.bat from the OpenImageIO folder you've either unziped or created in the previous [install section](#install). From there on out, all environment variables are set correctly and you can use tools, like oiiotool or iconvert, from the commandline. You can also use the python3 compiler to start a python session. Just import oiio and numpy and go crazy.

## test ##

Run oiiotool --help with root folder under C:\.

![image](https://github.com/pitvfx/OpenImageIO/assets/90990660/c78a9559-979d-439e-885c-36b422dc0ba7)

Great! To check if OpenColorIO is working scroll down to the last lines and find the a line starting with OpenColorIO.

![image](https://github.com/pitvfx/OpenImageIO/assets/90990660/a38d9a0e-358b-479f-9cfb-5c8637dd2d7e)

Found it? Awesome. Now let's test python! Simply start python by entering "python" into the console. Now let's check if this is actually the compiler from within our OpenImageIO directory by importing sys and checking the sys.exectuable.

![image](https://github.com/pitvfx/OpenImageIO/assets/90990660/b728419d-c032-48ac-ab6e-b02b9b634798)

The output should be python.exe in the python\bin folder of the root directory (C:\OpenImageIO). Next, let's try importing oiio and numpy:

![image](https://github.com/pitvfx/OpenImageIO/assets/90990660/a667d5c0-4b02-42a6-86e2-ad9c73768a99)

No errrors? Brilliant! You're good to go!

Have fun.
