@echo off
setlocal enabledelayedexpansion
echo Masukkan direktori file yang akan dicek:
set /p "dr=>"
@REM tampilkan list direktori
dir %dr% /w /s /a
@REM cari file java
for /R %dr% %%f in (*.java) do (
	echo Ada file Java pada direktori %%f
	echo %%~nxf ada, diganti namanya (y/t^)^?
	set /p "vl=>"
	@REM rename file java
	if "!vl!" == "y" (
		echo Input nama baru
		set /p "rn=>"
		REN %%f !rn!.java
		echo berhasil di ganti !rn!.java
	)
)
pause