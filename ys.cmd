:: %ChocolateyInstall%\bin
:: search youtube
::  
@ECHO OFF
@SET NM=
@SET SR=SIA
@IF NOT [%1]==[] SET SR=%1
@SET SR=%SR:"='%
@IF NOT [%2]==[] SET NM=%2

@yt-dlp --encoding cp866 "ytsearch%NM%:%SR%" --skip-download --no-warnings --print "%%(webpage_url)s;%%(upload_date)s" --print "%%(id)s;%%(language)s;%%(resolution)s;%%(protocol)s;%%(vcodec)s;%%(acodec)s;%%(format)s;%%(container)s" --print "%%(title)s;%%(ext)s;%%(format_id)s;%%(channel)s;%%(duration>%%H.%%M.%%S)s" | more & exit
::---------------------------------------------------------------------------------------------------------------------------------------------------------------

::alt_title
::%%(alt_title)s
::"%%(webpage_url)s;%%(alt_title)s"
::"%%(release_date)s
::%%(upload_date)s

:: ext: File extension
:: acodec: Name of the audio codec in use
:: vcodec: Name of the video codec in use
:: container: Name of the container format
:: protocol: The protocol that will be used for the actual download, lower-case (http, https, rtsp, rtmp, rtmpe, mms, f4m, ism, http_dash_segments, m3u8, or m3u8_native)
:: language: Language code
:: dynamic_range: The dynamic range of the video
:: format_id: A short description of the format
:: format: A human-readable description of the format
:: format_note: Additional info about the format
:: resolution: Textual description of width and height

:: id (string): Video identifier
:: title (string): Video title
:: url (string): Video URL
:: ext (string): Video filename extension
:: alt_title (string): A secondary title of the video
:: display_id (string): An alternative identifier for the video
:: uploader (string): Full name of the video uploader
:: license (string): License name the video is licensed under
:: creator (string): The creator of the video
:: release_date (string): The date (YYYYMMDD) when the video was released
:: timestamp (numeric): UNIX timestamp of the moment the video became available
:: upload_date (string): Video upload date (YYYYMMDD)
:: uploader_id (string): Nickname or id of the video uploader
:: channel (string): Full name of the channel the video is uploaded on
:: channel_id (string): Id of the channel
:: location (string): Physical location where the video was filmed
:: duration (numeric): Length of the video in seconds
:: view_count (numeric): How many users have watched the video on the platform
:: like_count (numeric): Number of positive ratings of the video
:: dislike_count (numeric): Number of negative ratings of the video
:: repost_count (numeric): Number of reposts of the video
:: average_rating (numeric): Average rating give by users, the scale used depends on the webpage
:: comment_count (numeric): Number of comments on the video
:: age_limit (numeric): Age restriction for the video (years)
:: is_live (boolean): Whether this video is a live stream or a fixed-length video
:: start_time (numeric): Time in seconds where the reproduction should start, as specified in the URL
:: end_time (numeric): Time in seconds where the reproduction should end, as specified in the URL
:: format (string): A human-readable description of the format
:: format_id (string): Format code specified by --format
:: format_note (string): Additional info about the format
:: width (numeric): Width of the video
:: height (numeric): Height of the video
:: resolution (string): Textual description of width and height
:: tbr (numeric): Average bitrate of audio and video in KBit/s
:: abr (numeric): Average audio bitrate in KBit/s
:: acodec (string): Name of the audio codec in use
:: asr (numeric): Audio sampling rate in Hertz
:: vbr (numeric): Average video bitrate in KBit/s
:: fps (numeric): Frame rate
:: vcodec (string): Name of the video codec in use
:: container (string): Name of the container format
:: filesize (numeric): The number of bytes, if known in advance
:: filesize_approx (numeric): An estimate for the number of bytes
:: protocol (string): The protocol that will be used for the actual download
:: extractor (string): Name of the extractor
:: extractor_key (string): Key name of the extractor
:: epoch (numeric): Unix epoch when creating the file
:: autonumber (numeric): Number that will be increased with each download, starting at --autonumber-start
:: playlist (string): Name or id of the playlist that contains the video
:: playlist_index (numeric): Index of the video in the playlist padded with leading zeros according to the total length of the playlist
:: playlist_id (string): Playlist identifier
:: playlist_title (string): Playlist title
:: playlist_uploader (string): Full name of the playlist uploader
:: playlist_uploader_id (string): Nickname or id of the playlist uploader
:: Available for the video that belongs to some logical chapter or section:
:: 
:: chapter (string): Name or title of the chapter the video belongs to
:: chapter_number (numeric): Number of the chapter the video belongs to
:: chapter_id (string): Id of the chapter the video belongs to
:: Available for the video that is an episode of some series or programme:
:: 
:: series (string): Title of the series or programme the video episode belongs to
:: season (string): Title of the season the video episode belongs to
:: season_number (numeric): Number of the season the video episode belongs to
:: season_id (string): Id of the season the video episode belongs to
:: episode (string): Title of the video episode
:: episode_number (numeric): Number of the video episode within a season
:: episode_id (string): Id of the video episode
:: Available for the media that is a track or a part of a music album:
:: 
:: track (string): Title of the track
:: track_number (numeric): Number of the track within an album or a disc
:: track_id (string): Id of the track
:: artist (string): Artist(s) of the track
:: genre (string): Genre(s) of the track
:: album (string): Title of the album the track belongs to
:: album_type (string): Type of the album
:: album_artist (string): List of all artists appeared on the album
:: disc_number (numeric): Number of the disc or other physical medium the track belongs to
:: release_year (numeric): Year (YYYY) when the album was released
:: 

:: Эксперименты -------------------------------------------------------------------------------------------------------------------------------------------------
::@yt-dlp  "ytsearch%NM%:%SR%" --skip-download --no-warnings --print filename -o "%%(id)s.%%(title)s.%%(ext)s" --print webpage_url & exit
::@yt-dlp "ytsearch%NM%:%SR%" --skip-download --no-warnings --print filename -o "%%(id)s;%%(title)s;%%(ext)s;%%(format_id)s;%%(channel)s;%%(duration>%%H.%%M.%%S)s" --print webpage_url & exit
::@yt-dlp "ytsearch%NM%:%SR%" --skip-download --no-warnings --print webpage_url --print "%%(id)s" --print "%%(title)s;%%(ext)s;%%(format_id)s;%%(channel)s;%%(duration>%%H.%%M.%%S)s" & exit
::%%(channel)s - %%(duration>%%H:%%M:%%S)s
::%%(webpage_url)s
::--encoding utf-8 --print title 
::When downloading with yt-dlp, use this flag to default to CRLF:
::--replace-in-metadata "description" "\n" "\r\n"

::yt-dlp ytsearch10:Аквариум ytstories:music --skip-download --no-warnings --print filename -o "%%(id)s.%%(title)s.%%(ext)s" --print webpage_url & exit
::@yt-dlp --encoding utf-8 "ytsearch%NM%:%SR%" --skip-download --no-warnings --print  webpage_url --print "%%(id)s;%%(language)s;%%(resolution)s;%%(protocol)s;%%(vcodec)s;%%(acodec)s;%%(format)s;%%(container)s" --print "%%(title)s;%%(ext)s;%%(format_id)s;%%(channel)s;%%(duration>%%H.%%M.%%S)s" | more & exit
::@yt-dlp --encoding utf-8 "ytsearch%NM%:%SR%" --skip-download --no-warnings --print "%%(webpage_url)s;%%(release_date)s" --print "%%(id)s;%%(language)s;%%(resolution)s;%%(protocol)s;%%(vcodec)s;%%(acodec)s;%%(format)s;%%(container)s" --print "%%(title)s;%%(ext)s;%%(format_id)s;%%(channel)s;%%(duration>%%H.%%M.%%S)s" | more & exit
::@yt-dlp "ytsearch%NM%:%SR%" --skip-download --no-warnings --print "%%(webpage_url)s;%%(release_date)s" --print "%%(id)s;%%(language)s;%%(resolution)s;%%(protocol)s;%%(vcodec)s;%%(acodec)s;%%(format)s;%%(container)s" --print "%%(title)s;%%(ext)s;%%(format_id)s;%%(channel)s;%%(duration>%%H.%%M.%%S)s" | more & exit
