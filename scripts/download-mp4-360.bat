::--external-downloader aria2c
::-%%(title)s
:: -f best
:: -f "bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]"
::--external-downloader aria2c --external-downloader-args '-c -x 4 2M' URL
::--external-downloader aria2c --external-downloader-args "--http-proxy=\"http://127.0.0.1:3128\" -c -x 4 2M"
::--external-downloader wget --external-downloader-args "-c"
::--external-downloader wget --external-downloader-args "-c"
::--proxy http://127.0.0.1:3128/ 
C:\Python37\Scripts\yt-dlp.exe --restrict-filenames --retries infinite -v -i -c -f "bestvideo[height<=360][ext=mp4]+bestaudio[ext=m4a]" --no-playlist %1 

