:: --buffer-size 16k 
:: keep files .mp4 .mp4
C:\Python37\Scripts\yt-dlp.exe --restrict-filenames --retries infinite -v -i -c -f "bestvideo[height<=144][ext=mp4]+bestaudio[ext=m4a]" --no-playlist  %*

