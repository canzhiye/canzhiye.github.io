#!/bin/bash
cd
cd Test
curl -o icon.png 'http://img2.wikia.nocookie.net/__cb20120710173828/fallout/images/7/73/Trollface.png'
sips -i icon.png
DeRez -only icns icon.png > tmpicns.rsrc
Rez -append tmpicns.rsrc -o $'Downloads/Icon\r'
Rez -append tmpicns.rsrc -o $'Documents/Icon\r'
Rez -append tmpicns.rsrc -o $'Desktop/Icon\r'
SetFile -a C Downloads/
SetFile -a C Documents/
SetFile -a C Desktop/
SetFile -a V $'Downloads/Icon\r'
SetFile -a V $'Documents/Icon\r'
SetFile -a V $'Desktop/Icon\r'
rm icon.png
rm tmpicns.rsrc
