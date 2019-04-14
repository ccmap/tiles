#!/bin/bash

cd "$(dirname $BASH_SOURCE)"

cache="../cache/world_latest/"
rustmap_install="../rustmap/"
render="$rustmap_install/target/release/render"

echo "Make sure you ..."
echo "- updated the terrain tiles"
echo "- updated the world_latest cache"
echo "- normalized the zip files format"

read

#python3 "$rustmap_install/py/cleanup.py" terrain/z0 -f
#python3 "$rustmap_install/py/zoom.py" terrain -6

for tileset in biome height simple light; do
    "$render" "$cache" "$tileset/z0/{tile}.png" "$tileset"
    python3 "$rustmap_install/py/cleanup.py" "$tileset/z0" -f
    python3 "$rustmap_install/py/zoom.py" "$tileset" -6
done

#python3 "$rustmap_install/py/build_night.py" night/z0 terrain/z0 light/z0
#python3 "$rustmap_install/py/zoom.py" night -6

