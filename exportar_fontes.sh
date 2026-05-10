#!/bin/bash

# Define os caminhos de origem do sistema Fedora
SISTEMA_MONO="/usr/share/fonts/jetbrains-mono-fonts"
SISTEMA_NL="/usr/share/fonts/jetbrains-mono-nl-fonts"

# Define o destino como uma pasta no diretório atual
DESTINO="./backup_FONTS"

echo "A exportar fontes para o diretório atual: $DESTINO"

# Cria as pastas no diretório atual
mkdir -p "$DESTINO/jetbrains-mono-fonts"
mkdir -p "$DESTINO/jetbrains-mono-nl-fonts"

# Verifica e copia as fontes Mono
if [ -d "$SISTEMA_MONO" ]; then
    echo "A copiar de $SISTEMA_MONO..."
    cp "$SISTEMA_MONO"/* "$DESTINO/jetbrains-mono-fonts/" 2>/dev/null
else
    echo "Pasta $SISTEMA_MONO não encontrada."
fi

# Verifica e copia as fontes NL
if [ -d "$SISTEMA_NL" ]; then
    echo "A copiar de $SISTEMA_NL..."
    cp "$SISTEMA_NL"/* "$DESTINO/jetbrains-mono-nl-fonts/" 2>/dev/null
else
    echo "Pasta $SISTEMA_NL não encontrada."
fi

# Garante que os ficheiros pertencem ao teu utilizador e têm permissões de leitura
chmod -R 755 "$DESTINO"

echo "Concluído! As fontes estão em: $(pwd)/backup_FONTS"
