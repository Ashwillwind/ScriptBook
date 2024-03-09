@ECHO OFF
::CP866
::@yt-dlp -f bestaudio --encoding utf8 --ignore-errors --skip-unavailable-fragment --retries 0 --fragment-retries 0 --no-check-certificate --sponsorblock-mark all --sponsorblock-remove all --downloader ffmpeg  --external-downloader-args ffmpeg:" -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=1p_BvaHsgGg -o - |ffplay -i - -nodisp -vn -autoexit -volume 11
::@yt-dlp @START /B CMD /C CALL yt-dlp -f bestaudio  --encoding cp866 --ignore-errors --skip-unavailable-fragment --retries 0 --fragment-retries 0 --no-check-certificate https://www.youtube.com/watch?v=1p_BvaHsgGg --skip-download  --no-warnings --print "-----------------------------------------------------------------"  --print title --print "View:%(view_count)s;%(duration>%H.%M.%S)s;%(upload_date>%D)s;Channel:%(channel)s" --print id --print webpage_url --print "%(resolution)s;%(protocol)s;%(acodec)s;%(vcodec)s;%(format)s;%(container)s;%(ext)s;%(format_id)s;%(language)s" 
@SET DNOW=@ECHO %DATE:~0,2%-%DATE:~3,2%-%DATE:~6,4%%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%:%TIME:~9,2%
::SetLocal EnableExtensions EnableDelayedExpansion
@SET OUTPUT=-o - 
@SET  INPUT=-i -

@SET NERR=2^>nul
::@SET NERR=

@SET YL=%1
@SET YLink=https://www.youtube.com/watch?v=%YL%

@SET YT=-f bestaudio
@SET VL=-volume 75
@SET FA=
@SET TP=1.0

@IF NOT [%2]==[] SET VL=-volume %2
@IF [%2]==[`] SET VL=-volume 75
@IF NOT [%3]==[] SET YT=-x -f %3
@IF [%3]==[`]    SET YT=-x -f bestaudio
@IF [%4]==[ogg] SET FA=-f ogg 
@IF [%4]==[`] SET FA=
@IF NOT [%5]==[] SET ST=-ss %5
@IF NOT [%5]==[`] SET ST=
@IF NOT [%6]==[] SET TP=%6
@IF [%1]==[-h] GOTO :HELP

@SET ODL=--downloader ffmpeg 
@SET ODA=--external-downloader-args ffmpeg:"%FA%%ST% -rtbufsize 15M -thread_queue_size 8M"

@SET PARALLEL=START /B CMD /C CALL

@SET NDISP=-nodisp -vn -autoexit

@SET EUTF8=--encoding utf8
@SET CP866=--encoding cp866

@SET YPC=--extractor-args "youtube:player_client=default,ios"
@SET GEO=--geo-bypass

@SET OP=
@SET OSP=--sponsorblock-mark all --sponsorblock-remove all
@SET OSC=--skip-unavailable-fragment --retries 0 --fragment-retries 0
@SET OCC=--no-check-certificate

@SET OIE=--ignore-errors
@SET OIW= --no-warnings

@SET OSD=--skip-download

@SET OP=%EUTF8% %OIE% %OSC% %OCC% %OSP% %ODL% %ODA%
::@SET OP=%OP% %GEO% %YPC%

@SET OPPR=%CP866% %OIE% %OSC% %OCC%

@SET PR=--print "-----------------------------------------------------------------" 
@SET PR=%PR% --print title
@SET PR=%PR% --print "View:%%(view_count)s;%%(duration>%%H.%%M.%%S)s;%%(upload_date>%%D)s;Channel:%%(channel)s"
@SET PR=%PR% --print id
@SET PR=%PR% --print webpage_url
@SET PR=%PR% --print "%%(resolution)s;%%(protocol)s;%%(acodec)s;%%(vcodec)s;%%(format)s;%%(container)s;%%(ext)s;%%(format_id)s;%%(language)s"

::Like:%%(like_count)s;

%DNOW%

@%PARALLEL% yt-dlp %YT%  %OPPR% %YLink% %OSD% %OIW% %PR%
@yt-dlp %YT% %OP% %YLink% %OUTPUT% %NERR%|ffplay %INPUT% %NDISP% %VL% %NERR% & exit 

::----------------------------------------------------------------------------------------------------------------------------------
::@ECHO yt-dlp %YT% %OP% %YLink% %OUTPUT% %NERR% ~~ ffplay %INPUT% %NDISP% %VL% %NERR% | clip
::@ECHO yt-dlp @%PARALLEL% yt-dlp %YT%  %OPPR% %YLink% %OSD% %OIW% %PR% | clip
::----------------------------------------------------------------------------------------------------------------------------------


::@yt-dlp -x %YT% https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn %VL% -autoexit 2>nul & exit 

::--encoding utf8
::--ignore-errors
::--extractor-args "youtube:player_client=default,ios" 
::--extractor-args "youtube:player_client=default,ios"

::-af "highpass=f=200, lowpass=f=3000" 
::-af "atempo=2"
::? -reverb_depth=10

::--extractor-args "youtube:player_client=default,ios"
::--geo-bypass 
:: yt-dlp -v -o "%(upload_date)s %(title)s.%(ext)s" -f bv*+?ba/b --extractor-args "youtube:player_client=default,ios" -S hdr:dv,res,vcodec:av1,acodec:opus,br --sponsorblock-mark all --sponsorblock-remove "sponsor, selfpromo" --embed-thumbnail --embed-chapters --embed-metadata --embed-subs --sub-langs

::--sponsorblock-mark all --sponsorblock-remove=all

@GOTO :EOF
:HELP
echo ya YoutubeId   Volume Format ffplayFormat beginTime aTemp
echo ` = default parametr
echo ya YKy4riaOBMk ` bestaudio
echo ya YKy4riaOBMk 32 251 ` 2:00
echo ya YKy4riaOBMk 42 251 ogg
echo ya YKy4riaOBMk 33 `  ogg

@GOTO :EOF

::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"-f ogg -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o -  2>nul | ffplay -i - -nodisp -vn -volume 75 -autoexit 2>nul & exit
::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit
::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - |ffplay -i - -nodisp -vn -volume %VL% -autoexit  & exit
::yt-dlp --downloader ffmpeg --external-downloader-args ffmpeg:"-f %YT% %ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit
::yt-dlp -f %YT% --cookies-from-browser chrome:"Profile 2" --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - |ffplay -i - -nodisp -vn -volume %VL% -autoexit  & exit

::@yt-dlp %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%FA%%ST% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -af "atempo=1.1" -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit

::@yt-dlp %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%FA%%ST% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit

::-af "atempo=2"
::? -reverb_depth=10

::-----------------------------------------------------------------------------------------------------

::@ECHO %DATE:~0,2%-%DATE:~3,2%-%DATE:~6,4%%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%:%TIME:~9,2%
::@yt-dlp -x %YT% --retries 0 --fragment-retries 0 --skip-unavailable-fragment --ignore-errors --no-check-certificate --encoding utf8 --downloader ffmpeg --external-downloader-args ffmpeg:"%FA%%ST% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn %VL% -autoexit 2>nul & exit 

::@ECHO yt-dlp %YT%  --downloader ffmpeg --external-downloader-args ffmpeg:"%FA%%ST% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL%
::@yt-dlp -x %YT% --geo-bypass --encoding cp866 https://www.youtube.com/watch?v=%YL% --skip-download --no-warnings --print "%%(webpage_url)s;View:%%(view_count)s;Like:%%(like_count)s;%%(upload_date>%%D)s" --print "%%(id)s;%%(language)s;%%(resolution)s;%%(protocol)s;%%(vcodec)s;%%(acodec)s;%%(format)s;%%(container)s" --print "%%(title)s;%%(ext)s;%%(format_id)s;%%(channel)s;%%(duration>%%H.%%M.%%S)s"
::@ECHO %DATE:~0,2%-%DATE:~3,2%-%DATE:~6,4%%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%:%TIME:~9,2%
::@ECHO ---------------------------------------------------


::START /B CMD /C CALL "foo.bat" [args [...]] >NUL 2>&1
::START /B CMD /C CALL 
::echo ::---------------------------------------------------

::yt-dlp -x %YT% --encoding utf8 --geo-bypass --downloader ffmpeg --external-downloader-args ffmpeg:"%FA%%ST% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn %VL% -autoexit 2>nul & exit 
::echo ::---------------------------------------------------
:: --print webpage_url
::echo https://www.youtube.com/watch?v=Ih61MJ72v1Y

::;View:3 4887 541;Like:120665;02/12/07
::echo Ih61MJ72v1Y
::;NA;320x240;https+https;vp09.00.20.08;opus;242 - 320x240 (240p)+251 - audio only (medium);NA
:: Evanescence - Hello
::;webm;242+251;
::ChristineR
::;00.03.41
::@yt-dlp --encoding cp866 https://www.youtube.com/watch?v=%YL% --skip-download --no-warnings --print "%%(webpage_url)s;View:%%(view_count)s;Like:%%(like_count)s;%%(upload_date>%%D)s" --print "%%(id)s;%%(language)s;%%(resolution)s;%%(protocol)s;%%(vcodec)s;%%(acodec)s;%%(format)s;%%(container)s" --print "%%(title)s;%%(ext)s;%%(format_id)s;%%(channel)s;%%(duration>%%H.%%M.%%S)s"
::echo ::---------------------------------------------------
::https://www.youtube.com/watch?v=cSSnSEczlCs
::https://www.youtube.com/watch?v=gOtTyWIJD1Q
::https://www.youtube.com/watch?v=zVokojoF_lY

::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"-f ogg -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o -  2>nul | ffplay -i - -nodisp -vn -volume 75 -autoexit 2>nul & exit
::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit
::yt-dlp -f %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - |ffplay -i - -nodisp -vn -volume %VL% -autoexit  & exit
::yt-dlp --downloader ffmpeg --external-downloader-args ffmpeg:"-f %YT% %ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit
::yt-dlp -f %YT% --cookies-from-browser chrome:"Profile 2" --downloader ffmpeg --external-downloader-args ffmpeg:"%ST% %FT% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - |ffplay -i - -nodisp -vn -volume %VL% -autoexit  & exit



::@yt-dlp %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%FA%%ST% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -af "atempo=1.1" -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit


::@ECHO %DNOW%:%TIME:~9,2%
::@ping -n 5 0.0.0.0
::@ECHO %DNOW%:%TIME:~9,2%


::@set /a count = 1
::@for /f "tokens=*" %%a in (ya.cmd) do @(
::@set /a count += 1 
::@echo !count! %%a)
::endlocal



:: NOT WORK !!!: -->

::ECHO "CIA=yt-dlp %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"""%FA%%ST% -rtbufsize 15M -thread_queue_size 8M""" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit"
::SET "CIA=yt-dlp %YT% --downloader ffmpeg --external-downloader-args ffmpeg:'%FA%%ST% -rtbufsize 15M -thread_queue_size 8M' https://www.youtube.com/watch?v=%YL% -o -  |ffplay -i - -nodisp -vn -volume %VL% -autoexit ^& exit"

::SET CYA=yt-dlp %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%FA%%ST% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o -  |ffplay -i - -nodisp -vn %VL% -autoexit  & exit 
::SET CYA=yt-dlp %YT% --downloader ffmpeg --external-downloader-args ffmpeg:" -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o -  |ffplay -i - -nodisp -vn %VL% -autoexit  & exit 
::ECHO ---------------------------------------------------
::@ECHO %CYA%
::ECHO -------------
::%CYA%

::%CYA%
::ECHO %CYA%

::SET CYA=
::@yt-dlp %YT% --downloader ffmpeg --external-downloader-args ffmpeg:"%FA%%ST% -rtbufsize 15M -thread_queue_size 8M" https://www.youtube.com/watch?v=%YL% -o - 2>nul |ffplay -i - -nodisp -vn -volume %VL% -autoexit 2>nul & exit 

::@SET PR1=--print "-----------------------------------------------------------------" 
::@SET PR2=--print "%%(webpage_url)s;View:%%(view_count)s;Like:%%(like_count)s;%%(upload_date>%%D)s" 
::@SET PR3=--print "%%(id)s;%%(language)s;%%(resolution)s;%%(protocol)s;%%(vcodec)s;%%(acodec)s;%%(format)s;%%(container)s" 
::@SET PR4=--print "%%(title)s;%%(ext)s;%%(format_id)s;%%(channel)s;%%(duration>%%H.%%M.%%S)s"

::SetLocal EnableDelayedExpansion
:: --geo-bypass add ~1.5sec wait strem play?
:: --extractor-args "youtube:player_client=default,ios" ?+ ~2sec?
