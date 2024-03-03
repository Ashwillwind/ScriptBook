:: %ChocolateyInstall%\bin
:: search youtube
::  
@ECHO OFF
@SET NM=
@SET SR=SIA
@IF [%1]==[] GOTO :HELP
@IF NOT [%1]==[] SET SR=%1
@SET SR=%SR:"='%
@IF NOT [%2]==[] SET NM=%2
@yt-dlp  "ytsearch%NM%:%SR%" --skip-download --no-warnings --print filename -o "%%(id)s.%%(title)s.%%(ext)s" --print webpage_url & exit
GOTO :EOF
:HELP
@ECHO USE Youtube Search (ys): 
@ECHO ys "SIA+Guetta" 5
@ECHO "SIA+Guetta" - search string
@ECHO 5 - result count
