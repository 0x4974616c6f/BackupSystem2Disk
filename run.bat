@echo off
call "%~dp0venv\Scripts\activate.bat"
cd "%~dp0"
python "%~dp0main.py"
pause
