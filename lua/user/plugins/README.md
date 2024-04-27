# how those plugins are loaded

this folder is scanned for plugins by lazy.

it will load: 

- all files in this folder with the extension `.lua`, looking for a return {}

- all folders in this folder, looking for a `init.lua` file with a return {}

- all subfolders specified as imports in lazy-plugins.lua with the previous 2 rules
