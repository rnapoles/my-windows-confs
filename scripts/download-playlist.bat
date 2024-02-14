::--external-downloader aria2c
::-%%(title)s
::--get-id --get-title --get-url
::C:\Python37\Scripts\yt-dlp.exe 
C:\Python37\Scripts\yt-dlp.exe -r 1M --restrict-filenames --retries infinite  -i -c --yes-playlist  -o "%%(playlist_index)s-%%(title)s.%%(ext)s" %1

