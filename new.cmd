@echo off
SET name=%1
IF "%name%" == "" SET name=Untitled
FOR /F "delims=" %%i IN ('unixdate') DO set today=%%i
COPY _drafts\blank.md _posts\%today%-%name%.md