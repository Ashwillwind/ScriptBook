::YKy4riaOBMk
@ECHO OFF
@SET YL=%1
@SET VL=75
@SET YT=best
@IF NOT [%2]==[] SET YT=%2
@IF [%2]==[q] SET YT=best
@IF NOT [%3]==[] SET VL=%3
@IF NOT [%4]==[] SET ST=-ss 4
yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% -hide_banner -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o -  2>nul | ffplay -i - -noborder -autoexit -top 60 -left 1750 -x 700 -volume %VL% -autoexit -hide_banner -alwaysontop 2>nul & exit
