These versions of Subtitle Workshop and Subtitle API are developed with Delphi 2007.

Additional components Subtitle Workshop requires:
- SWComponents (included in source, see "SWComponents" directory)
- Innerfuse Pascal Script 3 (IFPS3) - current version used is 1.33 (included in source, see "3rd party components" directory)
- VirtualTreeView - current version used is 4.8.6 - http://www.delphi-gems.com/VirtualTreeview/

Additional components Subtitle API requires:
- XML Parser (http://www.destructor.de/xmlparser/index.htm) - current version used is 1.0.17


To compile Subtitle Workshop's source code successfully:
1. Use Delphi 7, other versions won't work.
2. Install all the components listed above.
3. Add the paths to the source code directories for those components to your Delphi 7 Library path (Tools: Environment Options: Library).


UPX (The Ultimate Packer for eXecutables) is used for compression (through Bin\Compress.bat) - current version used is 3.08w - http://upx.sourceforge.net/

NSIS (nullsoft scriptable install system) is used for the creation of the installer file (through Installer\SubtitleWorkshop.nsi) - current version used is 2.46 - http://nsis.sourceforge.net


Subtitle Workshop and Subtitle API are released under the GNU/GPL 3 license.

v6.0c
-------
* Innerfuse Pascal Script 3 (IFPS3) replaced with successor, RemObjects PascalScript (latest from Git repository) - https://github.com/remobjects/pascalscript
* VirtualTreeView updated from 4.8.6 to 5.3.0 (http://www.soft-gems.net/)
* Added XP Manifest, now Subtitle Workshop looks modern on Windows XP and higher
* Misc little changes

