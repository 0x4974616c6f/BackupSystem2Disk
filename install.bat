@echo off

echo Criando ambiente virtual...
python -m venv venv
call venv\Scripts\activate.bat

echo Instalando dependências...
pip install -r requirements.txt

echo Por favor, insira o caminho da pasta de origem:
set /p SOURCE_FOLDER=

echo Por favor, insira o caminho da pasta de destino:
set /p DEST_FOLDER=

rem Replacing single backslashes with double backslashes in the paths
set ESCAPED_SOURCE_FOLDER=%SOURCE_FOLDER:\=\\%
set ESCAPED_DEST_FOLDER=%DEST_FOLDER:\=\\%

(
echo {
echo   "source_folder": "%ESCAPED_SOURCE_FOLDER%",
echo   "dest_folder": "%ESCAPED_DEST_FOLDER%"
echo }
) > config.json

echo Instalação concluída. O arquivo config.json foi criado com os caminhos fornecidos.

echo Copiando run_hidden.vbs para a pasta de inicialização...
copy run_hidden.vbs "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"

setx BACKUP_SCRIPT_PATH "%CD%"

echo run_hidden.vbs copiado para a pasta de inicialização.
