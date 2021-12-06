@echo OFF
echo masukkan direktori file yang akan dicek
set /p "dr=>"
@REM tampilkan list direktori
DIR %dr% /w /s /a
@REM cari file java
for /R %dr% %%f in (*.java) do (
    echo Ada file Java pada direktori %%f
)
pause