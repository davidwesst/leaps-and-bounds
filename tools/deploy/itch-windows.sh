pushd ./build/windows
butler push --userversion-file ./buildversion.txt . davidwesst/leaps-and-bounds:windows
pushd
butler status davidwesst/leaps-and-bounds:windows