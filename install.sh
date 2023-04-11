@echo off

echo Criando ambiente virtual...
python -m venv venv
call venv\Scripts\activate.bat

echo Instalando dependências...
pip install -r requirements.txt

echo Copiando o arquivo de configuração de exemplo...
copy config.json.example config.json

echo Instalação concluída. Por favor, edite o arquivo config.json conforme necessário.
