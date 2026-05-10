#!/bin/bash

# Define a origem como a pasta no diretório onde o script é executado
ORIGEM="./backup_FONTS"

# Define os destinos no sistema Fedora
PATH_MONO="/usr/share/fonts/jetbrains-mono-fonts"
PATH_NL="/usr/share/fonts/jetbrains-mono-nl-fonts"

# Verifica se a pasta de origem existe no local atual
if [ ! -d "$ORIGEM" ]; then
    echo "Erro: A pasta $ORIGEM não foi encontrada no diretório atual."
    exit 1
fi

# Cria as diretorias de destino no sistema caso não existam
sudo mkdir -p "$PATH_MONO"
sudo mkdir -p "$PATH_NL"

echo "A iniciar a instalação das fontes em ambiente de sistema..."

# Itera sobre todos os ficheiros dentro da pasta de origem
for f in "$ORIGEM"/*; do
    # Garante que estamos a processar um ficheiro
    if [ -f "$f" ]; then
        # Extrai o nome e remove caracteres ":" residuais
        nome_base=$(basename "$f" | sed 's/://g')

        # Triagem: Se o nome contiver 'NL' vai para a pasta NL, caso contrário vai para a Mono
        if [[ "$nome_base" == *"NL"* ]]; then
            echo "A instalar $nome_base em $PATH_NL"
            sudo cp "$f" "$PATH_NL/$nome_base"
        else
            echo "A instalar $nome_base em $PATH_MONO"
            sudo cp "$f" "$PATH_MONO/$nome_base"
        fi
    fi
done

# Define permissões globais de leitura para o sistema
sudo chmod 644 "$PATH_MONO"/* 2>/dev/null
sudo chmod 644 "$PATH_NL"/* 2>/dev/null

# Notifica o motor de renderização sobre as novas fontes
echo "A atualizar a cache de fontes global..."
sudo fc-cache -fv

echo "Instalação terminada com sucesso!"
