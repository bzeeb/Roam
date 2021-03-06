@ECHO OFF
REM ---------------------------------------------------------------------------------------

REM Script to package Roam and all needed files using py2exe.  Result files will
REM be in the dist folder.

REM Change %OSGEO4W_ROOT% in setenv.bat to change in the location of QGIS.

REM ---------------------------------------------------------------------------------------

pushd %~dp0

call setenv.bat

ECHO Building Roam package

ECHO OSGeo path is: %OSGEO4W_ROOT%
ECHO Getting QGIS libs from: %QGIS%
ECHO Python loaded from: %PYTHONHOME%

>package.log (
	rmdir build /S/Q
	python setup.py clean && python setup.py py2exe
)
popd

ECHO Package in dist\
ECHO Check package.log for build log

if defined DOUBLECLICKED pause
