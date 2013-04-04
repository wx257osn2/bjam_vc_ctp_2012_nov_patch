@set VCINSTALLDIR=
@call :GetVCInstallDirHelper32 HKLM > nul 2>&1
@if errorlevel 1 call :GetVCInstallDirHelper32 HKCU > nul 2>&1
@if errorlevel 1 call :GetVCInstallDirHelper64  HKLM > nul 2>&1
@if errorlevel 1 call :GetVCInstallDirHelper64  HKCU > nul 2>&1
@exit /B 0

:GetVCInstallDirHelper32
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\VisualStudio\SxS\VC_CTP" /v "Nov2012"') DO (
	@if "%%i"=="Nov2012" (
		@SET "CTPINSTALLDIR=%%k"
	)
)
@if "%CTPINSTALLDIR%"=="" exit /B 1
@exit /B 0

:GetVCInstallDirHelper64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\SxS\VC_CTP" /v "Nov2012"') DO (
	@if "%%i"=="Nov2012" (
		@SET "CTPINSTALLDIR=%%k"
	)
)
@if "%VCINSTALLDIR%"=="" exit /B 1
@exit /B 0