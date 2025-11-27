#!/bin/bash

# Script para gerar ícones do app GetJulia
# Requer: ImageMagick (brew install imagemagick)

SOURCE_IMAGE="${1:-../GetJulia/WebContent/meta/apple-touch-icon.png}"
OUTPUT_DIR="../GetJulia/Assets.xcassets/AppIcon.appiconset"

# Verificar se o arquivo fonte existe
if [ ! -f "$SOURCE_IMAGE" ]; then
    echo "Erro: Arquivo fonte não encontrado: $SOURCE_IMAGE"
    echo "Uso: ./generate-icons.sh [caminho-para-imagem-1024x1024.png]"
    exit 1
fi

# Verificar se ImageMagick está instalado
if ! command -v convert &> /dev/null; then
    echo "Erro: ImageMagick não está instalado."
    echo "Instale com: brew install imagemagick"
    exit 1
fi

# Criar diretório de saída se não existir
mkdir -p "$OUTPUT_DIR"

echo "Gerando ícones do app..."

# iPhone icons
convert "$SOURCE_IMAGE" -resize 40x40 "$OUTPUT_DIR/AppIcon-20@2x.png"
convert "$SOURCE_IMAGE" -resize 60x60 "$OUTPUT_DIR/AppIcon-20@3x.png"
convert "$SOURCE_IMAGE" -resize 58x58 "$OUTPUT_DIR/AppIcon-29@2x.png"
convert "$SOURCE_IMAGE" -resize 87x87 "$OUTPUT_DIR/AppIcon-29@3x.png"
convert "$SOURCE_IMAGE" -resize 80x80 "$OUTPUT_DIR/AppIcon-40@2x.png"
convert "$SOURCE_IMAGE" -resize 120x120 "$OUTPUT_DIR/AppIcon-40@3x.png"
convert "$SOURCE_IMAGE" -resize 120x120 "$OUTPUT_DIR/AppIcon-60@2x.png"
convert "$SOURCE_IMAGE" -resize 180x180 "$OUTPUT_DIR/AppIcon-60@3x.png"

# iPad icons
convert "$SOURCE_IMAGE" -resize 20x20 "$OUTPUT_DIR/AppIcon-20.png"
convert "$SOURCE_IMAGE" -resize 40x40 "$OUTPUT_DIR/AppIcon-20@2x-ipad.png"
convert "$SOURCE_IMAGE" -resize 29x29 "$OUTPUT_DIR/AppIcon-29.png"
convert "$SOURCE_IMAGE" -resize 58x58 "$OUTPUT_DIR/AppIcon-29@2x-ipad.png"
convert "$SOURCE_IMAGE" -resize 40x40 "$OUTPUT_DIR/AppIcon-40.png"
convert "$SOURCE_IMAGE" -resize 80x80 "$OUTPUT_DIR/AppIcon-40@2x-ipad.png"
convert "$SOURCE_IMAGE" -resize 76x76 "$OUTPUT_DIR/AppIcon-76.png"
convert "$SOURCE_IMAGE" -resize 152x152 "$OUTPUT_DIR/AppIcon-76@2x.png"
convert "$SOURCE_IMAGE" -resize 167x167 "$OUTPUT_DIR/AppIcon-83.5@2x.png"

# App Store icon
convert "$SOURCE_IMAGE" -resize 1024x1024 "$OUTPUT_DIR/AppIcon-1024.png"

echo "Ícones gerados com sucesso em: $OUTPUT_DIR"
echo ""
echo "Tamanhos gerados:"
ls -la "$OUTPUT_DIR"/*.png 2>/dev/null | awk '{print $NF}' | xargs -I {} basename {}
