@echo off

e:

rem form log file name 
set CUR_YYYY=%date:~6,4%
set CUR_MM=%date:~3,2%
set CUR_DD=%date:~0,2%
set LOGFILENAME=E:\bklogs\%CUR_YYYY%%CUR_MM%%CUR_DD%bk.log

echo %date% %time% start backup > %LOGFILENAME%

rem year backup 

if %date:~0,5% == 01.01 (
  echo %date% %time% Happy New Year!! >> %LOGFILENAME%
  echo %date% %time% move current files to year archive >> %LOGFILENAME%
  move \1today\* \7yearly\%CUR_YYYY% >> %LOGFILENAME%
  echo hear may be zip >> %LOGFILENAME%
  GOTO END
)

rem month backup

if %date:~0,2% == 01 (
  echo %date% %time% delete files from 6month_prev >> %LOGFILENAME%
  del /q/f/s \6month_prev\* >> %LOGFILENAME%
  echo %date% %time% move prev files >> %LOGFILENAME%
  move \5monthly\* \6month_prev\ >> %LOGFILENAME%
  echo %date% %time% move current files to 5monthly >> %LOGFILENAME%
  move \1today\* \5monthly\ >> %LOGFILENAME%
  GOTO END
)

rem decade backup

if %date:~1,1% == 6 (
  echo %date% %time% delete files from 4decade_prev >> %LOGFILENAME%
  del /q/f/s \4decade_prev\* >> %LOGFILENAME%
  echo %date% %time% move prev decade files  >> %LOGFILENAME%
  move \3decade\* \4decade_prev\ >> %LOGFILENAME%
  echo %date% %time% move current files to 3decade >> %LOGFILENAME%
  move \1today\* \3decade\ >> %LOGFILENAME%
  GOTO END
)

echo %date% %time% delete files from old >> %LOGFILENAME%
del /q/f/s \old\* >> %LOGFILENAME%
echo %date% %time% move files 2yesterday to old >> %LOGFILENAME%
move \2yesterday\* \old\ >> %LOGFILENAME%
echo %date% %time% move current files to 2yesterday >> %LOGFILENAME%
move \1today\* \2yesterday\ >> %LOGFILENAME%
echo %date% %time% end >> %LOGFILENAME%

:END
