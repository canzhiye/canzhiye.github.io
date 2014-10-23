#!/bin/bash
cd
curl -o icon.png 'http://img2.wikia.nocookie.net/__cb20120710173828/fallout/images/7/73/Trollface.png'
sips -i icon.png
DeRez -only icns icon.png > tmpicns.rsrc
Rez -append tmpicns.rsrc -o $'TEST/Icon\r'
SetFile -a C TEST/
SetFile -a V $'TEST/Icon\r'