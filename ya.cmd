@ECHO OFF
@SET YL=%1
@SET YT=-f bestaudio
@SET VL=75
@SET FA=
@SET TP=1.0

@IF NOT [%2]==[] SET VL=%2
@IF [%2]==[`] SET VL=75

@IF NOT [%3]==[] SET YT=-f %3
@IF [%3]==[`] SET YT=-f bestaudio

@IF [%4]==[ogg] SET FA=-f ogg 
@IF [%4]==[`] SET FA=

@IF NOT [%5]==[] SET ST=-ss %5
@IF NOT [%5]==[`] SET ST=

@IF NOT [%6]==[] SET TP=%6


@IF [%1]==[-h] GOTO :HELP

@yt-dlp %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%FA%%ST% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit

::-af "atempo=2"
::? -reverb_depth=10

@GOTO :EOF
:HELP
echo ya YoutubeId   Volume Format ffplayFormat beginTime aTemp
echo ` = default parametr
echo ya YKy4riaOBMk ` bestaudio
echo ya YKy4riaOBMk 32 251 ` 2:00
echo ya YKy4riaOBMk 42 251 ogg
echo ya YKy4riaOBMk ` ` ogg


::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"-f ogg -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o -  2>nul | ffplay -i - -nodisp -vn -volume 75 -autoexit 2>nul & exit
::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit
::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - |ffplay -i - -nodisp -vn -volume %VL% -autoexit  & exit
::yt-dlp --downloader ffmpeg --external-downloader-args ffmpeg:"-f %YT% %ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit
::yt-dlp -f %YT% --cookies-from-browser chrome:"Profile 2" --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - |ffplay -i - -nodisp -vn -volume %VL% -autoexit  & exit



::@yt-dlp %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%FA%%ST% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -af "atempo=1.1" -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit
