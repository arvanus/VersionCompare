﻿# VersionCompare
How to use:
Add do PATH, or install with Boss


## ⚙️ Installation
Installation is done using the [`boss install`](https://github.com/HashLoad/boss) command:
``` sh
$ boss install arvanus/VersionCompare
```

Add to your uses `uVersionCompare`

Examples:
```
VersionCompare('2','1'); //1
VersionCompare('1.1.56789','1.2.0');//-1
VersionCompare('2.0','2.0'); //0
VersionCompare('2.0','2'); //0
VersionCompare('2.0','2', false); //0
```
