set BUILD_CONFIG=Release

cmake -G "%CMAKE_GENERATOR%" ^
    -DCMAKE_BUILD_TYPE="%BUILD_CONFIG%" ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX%

if errorlevel 1 exit 1

REM Build step
cmake --build .
if errorlevel 1 exit 1

cmake --build . --target check
if errorlevel 1 exit 1

REM Install step
cmake --build . --target install
if errorlevel 1 exit 1
