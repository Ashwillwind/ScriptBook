::@ECHO OFF
@SET YL=%1
@IF [%1]==[-h] GOTO :HELP
yt-dlp -F -f best https://www.youtube.com/watch?v=%YL% | more  & exit

@GOTO :EOF
:HELP
echo yq Jl8iYAo90pE
