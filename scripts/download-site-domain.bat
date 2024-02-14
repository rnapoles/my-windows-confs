SET /A test=%RANDOM%
::1 %2
START /B CMD /C CALL wget -o %test%.log --no-check-certificate -e robots=off -r --no-clobber --page-requisites --html-extension -k --restrict-file-names=windows --adjust-extension -np --domains %*  