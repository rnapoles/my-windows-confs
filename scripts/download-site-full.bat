::--adjust-extension
::--random-wait -w 10
SET /A test=%RANDOM%
START /B CMD /C CALL wget -o %test%.log -U "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)" --no-check-certificate -e robots=off -r --no-clobber --page-requisites --html-extension -k --restrict-file-names=windows --adjust-extension --mirror %*