<div align="center">
  <img src="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/cube.svg" width="80" alt="Minecraft Block Icon">
  <h1>Instalador Automático de Mods (Minecraft Bedrock)</h1>
  <p><strong>A maneira mais rápida e fácil de instalar múltiplos mods de uma só vez no Windows 10/11.</strong></p>
  
  [![Website](https://img.shields.io/badge/Website-Acesse_a_P%C3%A1gina-4CAF50?style=for-the-badge)](https://YgorSomosFibra.github.io/InstaladorMods/)
  [![Download](https://img.shields.io/badge/Download-.EXE-blue?style=for-the-badge)](https://github.com/YgorSomosFibra/InstaladorMods/raw/main/InstaladorMods.exe)
</div>

---

## 🚀 Sobre o Projeto (About)
Quem joga **Minecraft Bedrock Edition** no PC sabe como é chato ter que dar um duplo clique em dezenas de arquivos `.mcpack` e `.mcaddon` e esperar o jogo abrir e carregar cada um deles separadamente.

O **InstaladorMods** resolve esse problema! Ele é um software super leve feito em PowerShell (com interface gráfica) que pega uma pasta inteira cheia de mods e injeta todos eles diretamente no seu jogo em questão de segundos. Ele lê o manifesto de cada mod e sabe exatamente o que é Textura (`resource_packs`) e o que é Comportamento (`behavior_packs`).

🌐 **Acesse o site oficial do projeto:** [https://YgorSomosFibra.github.io/InstaladorMods/](https://YgorSomosFibra.github.io/InstaladorMods/)

## ✨ Funcionalidades
- ⚡ **Bulk Install (Instalação em Lote):** Selecione uma pasta e instale tudo de uma vez.
- 🎨 **Interface Gráfica Nativa:** Sem telas pretas ou códigos. Uma janela limpa e bonita (Dark Mode).
- 📂 **Suporte a Drag & Drop:** Arraste sua pasta de mods direto para o programa.
- 📊 **Painel de Estatísticas:** Veja quantos packs o seu Minecraft já tem instalados e quantos foram adicionados.
- 🔍 **Detecção Automática:** Localiza automaticamente a pasta oculta da Mojang no Windows.

## 📥 Como Baixar e Usar
1. Acesse o nosso [Site Oficial](https://YgorSomosFibra.github.io/InstaladorMods/) ou clique [AQUI](https://github.com/YgorSomosFibra/InstaladorMods/raw/main/InstaladorMods.exe) para baixar o executável (`InstaladorMods.exe`).
2. Coloque todos os seus arquivos `.mcpack` e `.mcaddon` em uma única pasta.
3. Abra o programa `InstaladorMods.exe`.
4. Clique em **Procurar** e selecione a pasta com seus mods.
5. Clique em **INSTALAR MODS**.
6. Abra o Minecraft Bedrock, edite seu mundo e ative os pacotes de recursos/comportamentos recém-instalados!

## 🛠️ Para Desenvolvedores (Open Source)
Quer modificar o programa ou entender como ele funciona? 
O código é totalmente aberto. O coração do programa está no script `InstaladorMods.ps1`.

### Compilando sua própria versão
O repositório já inclui um script para transformar o `.ps1` em um `.exe` usando o compilador C# nativo do Windows:
1. Clone este repositório.
2. Certifique-se de ter um `icon.ico` válido na pasta.
3. Execute o `compile_exe.ps1` usando o PowerShell.
4. O arquivo `InstaladorMods.exe` será recriado instantaneamente.

## 🌐 English Description
**Minecraft Bedrock Bulk Mod Installer** is a Windows 10/11 tool designed to install multiple `.mcpack` and `.mcaddon` files simultaneously. Instead of clicking and importing each mod one by one in the game, you can just point this tool to a folder, and it will automatically extract and sort all resource packs and behavior packs directly into your Minecraft game data folder in seconds.

## 📝 Licença
Distribuído sob a licença MIT. Feito de jogador para jogador. 

---
*Aviso: Este projeto não tem afiliação com a Mojang AB ou Microsoft Corporation.*
