# Instalador de Mods - Minecraft Bedrock

Uma ferramenta simples e rápida com Interface Gráfica (GUI) para instalar múltiplos mods (`.mcpack`, `.mcaddon`) de uma só vez no Minecraft Bedrock Edition (Windows 10/11).

## Recursos
- **Interface Gráfica Moderna:** Desenvolvida nativamente usando PowerShell (Windows Forms).
- **Auto-Detecção:** Localiza automaticamente a pasta do seu Minecraft no computador.
- **Instalação Inteligente:** Separa automaticamente arquivos de Textura (`resource_packs`) e Comportamentos (`behavior_packs`).
- **Verificação de Instalação:** Mostra quantos packs estão instalados antes e depois.
- **Portátil:** Versão compilada `.exe` disponível para rodar sem depender do terminal.

## Como Usar
1. Baixe o `InstaladorMods.exe`.
2. Coloque seus mods (arquivos `.mcpack` e `.mcaddon`) em uma pasta.
3. Abra o instalador, selecione a pasta com seus mods e clique em **Instalar Mods**.
4. Abra o Minecraft e ative-os no seu mundo!

## Compilação (Para Desenvolvedores)
O script `compile_exe.ps1` pode ser utilizado para compilar o código fonte `InstaladorMods.ps1` em um executável autônomo com ícone personalizado usando o compilador C# nativo do Windows (`csc.exe`).
