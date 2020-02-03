pushd ./build/web
butler push --userversion-file ./buildversion.txt . davidwesst/leaps-and-bounds:web
pushd
butler status davidwesst/leaps-and-bounds:web