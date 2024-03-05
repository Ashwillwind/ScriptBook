::@ECHO OFF
@SET YL=%1
@SET YT=bestaudio
@SET VL=75

@IF NOT [%2]==[] SET YT=%2
@IF NOT [%3]==[] (IF NOT [%3]==[ogg] SET VL=%3)
@IF [%3]==[ogg] SET FT=-f ogg
@IF [%3]==[q] SET FT= & SET VL=75
@IF NOT [%4]==[] SET ST=-ss %4
@IF [%1]==[-h] GOTO :HELP
::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"-f ogg -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o -  2>nul | ffplay -i - -nodisp -vn -volume 75 -autoexit 2>nul & exit
::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit
::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - |ffplay -i - -nodisp -vn -volume %VL% -autoexit  & exit

yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit
::yt-dlp -f %YT% --cookies-from-browser chrome:"Profile 2" --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - |ffplay -i - -nodisp -vn -volume %VL% -autoexit  & exit

@GOTO :EOF
:HELP
echo ya YKy4riaOBMk best ogg
echo ya YKy4riaOBMk best q 2:00
echo ya YKy4riaOBMk
