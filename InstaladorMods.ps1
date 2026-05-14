Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.IO.Compression.FileSystem

[System.Windows.Forms.Application]::EnableVisualStyles()

# ==================== CORES E FONTES ====================
$bgColor       = [System.Drawing.Color]::FromArgb(30, 30, 30)
$panelColor    = [System.Drawing.Color]::FromArgb(45, 45, 45)
$accentColor   = [System.Drawing.Color]::FromArgb(76, 175, 80)
$accentHover   = [System.Drawing.Color]::FromArgb(56, 142, 60)
$textColor     = [System.Drawing.Color]::White
$textMuted     = [System.Drawing.Color]::FromArgb(180, 180, 180)
$logBg         = [System.Drawing.Color]::FromArgb(20, 20, 20)
$errorColor    = [System.Drawing.Color]::FromArgb(244, 67, 54)
$warnColor     = [System.Drawing.Color]::FromArgb(255, 193, 7)
$successColor  = [System.Drawing.Color]::FromArgb(76, 175, 80)
$infoColor     = [System.Drawing.Color]::FromArgb(100, 181, 246)

$fontTitle     = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$fontNormal    = New-Object System.Drawing.Font("Segoe UI", 9)
$fontBold      = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$fontLog       = New-Object System.Drawing.Font("Consolas", 9)
$fontButton    = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$fontSmall     = New-Object System.Drawing.Font("Segoe UI", 8)

# ==================== FORMULARIO PRINCIPAL ====================
$form = New-Object System.Windows.Forms.Form
$form.Text = "Instalador de Mods - Minecraft Bedrock"
$form.Size = New-Object System.Drawing.Size(600, 660)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedSingle"
$form.MaximizeBox = $false
$form.BackColor = $bgColor
$form.ForeColor = $textColor
$form.AllowDrop = $true

# ==================== CABECALHO ====================
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(600, 70)
$headerPanel.BackColor = $panelColor

$lblTitle = New-Object System.Windows.Forms.Label
$lblTitle.Text = "Instalador de Mods"
$lblTitle.Font = $fontTitle
$lblTitle.ForeColor = $accentColor
$lblTitle.Location = New-Object System.Drawing.Point(20, 10)
$lblTitle.Size = New-Object System.Drawing.Size(400, 30)
$lblTitle.BackColor = [System.Drawing.Color]::Transparent

$lblSubtitle = New-Object System.Windows.Forms.Label
$lblSubtitle.Text = "Minecraft Bedrock Edition - Instale todos os seus mods de uma vez"
$lblSubtitle.Font = $fontSmall
$lblSubtitle.ForeColor = $textMuted
$lblSubtitle.Location = New-Object System.Drawing.Point(22, 42)
$lblSubtitle.Size = New-Object System.Drawing.Size(500, 18)
$lblSubtitle.BackColor = [System.Drawing.Color]::Transparent

$headerPanel.Controls.Add($lblTitle)
$headerPanel.Controls.Add($lblSubtitle)

# ==================== PAINEL DE VERIFICACAO ====================
$statsPanel = New-Object System.Windows.Forms.Panel
$statsPanel.Location = New-Object System.Drawing.Point(0, 70)
$statsPanel.Size = New-Object System.Drawing.Size(600, 60)
$statsPanel.BackColor = [System.Drawing.Color]::FromArgb(38, 38, 38)

# Card: Resource Packs
$cardResource = New-Object System.Windows.Forms.Panel
$cardResource.Location = New-Object System.Drawing.Point(15, 8)
$cardResource.Size = New-Object System.Drawing.Size(175, 44)
$cardResource.BackColor = [System.Drawing.Color]::FromArgb(55, 55, 55)

$lblResourceTitle = New-Object System.Windows.Forms.Label
$lblResourceTitle.Text = "TEXTURAS INSTALADAS"
$lblResourceTitle.Font = $fontSmall
$lblResourceTitle.ForeColor = $textMuted
$lblResourceTitle.Location = New-Object System.Drawing.Point(8, 5)
$lblResourceTitle.Size = New-Object System.Drawing.Size(160, 14)
$lblResourceTitle.BackColor = [System.Drawing.Color]::Transparent

$lblResourceCount = New-Object System.Windows.Forms.Label
$lblResourceCount.Text = "..."
$lblResourceCount.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$lblResourceCount.ForeColor = $infoColor
$lblResourceCount.Location = New-Object System.Drawing.Point(8, 18)
$lblResourceCount.Size = New-Object System.Drawing.Size(160, 22)
$lblResourceCount.BackColor = [System.Drawing.Color]::Transparent

$cardResource.Controls.Add($lblResourceTitle)
$cardResource.Controls.Add($lblResourceCount)

# Card: Behavior Packs
$cardBehavior = New-Object System.Windows.Forms.Panel
$cardBehavior.Location = New-Object System.Drawing.Point(200, 8)
$cardBehavior.Size = New-Object System.Drawing.Size(175, 44)
$cardBehavior.BackColor = [System.Drawing.Color]::FromArgb(55, 55, 55)

$lblBehaviorTitle = New-Object System.Windows.Forms.Label
$lblBehaviorTitle.Text = "COMPORTAMENTOS"
$lblBehaviorTitle.Font = $fontSmall
$lblBehaviorTitle.ForeColor = $textMuted
$lblBehaviorTitle.Location = New-Object System.Drawing.Point(8, 5)
$lblBehaviorTitle.Size = New-Object System.Drawing.Size(160, 14)
$lblBehaviorTitle.BackColor = [System.Drawing.Color]::Transparent

$lblBehaviorCount = New-Object System.Windows.Forms.Label
$lblBehaviorCount.Text = "..."
$lblBehaviorCount.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$lblBehaviorCount.ForeColor = $accentColor
$lblBehaviorCount.Location = New-Object System.Drawing.Point(8, 18)
$lblBehaviorCount.Size = New-Object System.Drawing.Size(160, 22)
$lblBehaviorCount.BackColor = [System.Drawing.Color]::Transparent

$cardBehavior.Controls.Add($lblBehaviorTitle)
$cardBehavior.Controls.Add($lblBehaviorCount)

# Botao Verificar
$btnVerify = New-Object System.Windows.Forms.Button
$btnVerify.Location = New-Object System.Drawing.Point(390, 12)
$btnVerify.Size = New-Object System.Drawing.Size(185, 36)
$btnVerify.Text = "Verificar Instalacao"
$btnVerify.FlatStyle = "Flat"
$btnVerify.BackColor = [System.Drawing.Color]::FromArgb(55, 55, 55)
$btnVerify.ForeColor = $textColor
$btnVerify.Font = $fontBold
$btnVerify.Cursor = [System.Windows.Forms.Cursors]::Hand
$btnVerify.FlatAppearance.BorderColor = $textMuted
$btnVerify.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::FromArgb(70, 70, 70)

$statsPanel.Controls.Add($cardResource)
$statsPanel.Controls.Add($cardBehavior)
$statsPanel.Controls.Add($btnVerify)

function Refresh-Stats {
    $pkgDir = "$env:LOCALAPPDATA\Packages"
    $mcPkg = Get-ChildItem -Path $pkgDir -Directory -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -like "*Minecraft*" -and $_.Name -like "*8wekyb3d8bbwe*" } |
        Select-Object -First 1
    if ($null -ne $mcPkg) {
        $mojang = Join-Path $mcPkg.FullName "LocalState\games\com.mojang"
        $resDir = Join-Path $mojang "resource_packs"
        $behDir = Join-Path $mojang "behavior_packs"
        $resCount = if (Test-Path $resDir) { (Get-ChildItem $resDir -Directory -ErrorAction SilentlyContinue).Count } else { 0 }
        $behCount = if (Test-Path $behDir) { (Get-ChildItem $behDir -Directory -ErrorAction SilentlyContinue).Count } else { 0 }
        $lblResourceCount.Text = "$resCount packs"
        $lblBehaviorCount.Text = "$behCount packs"
    } else {
        $lblResourceCount.Text = "N/A"
        $lblBehaviorCount.Text = "N/A"
    }
}

$btnVerify.Add_Click({ Refresh-Stats })
$form.Add_Shown({ Refresh-Stats })

# ==================== SELECAO DE PASTA ====================
$lblFolder = New-Object System.Windows.Forms.Label
$lblFolder.Text = "PASTA DOS MODS"
$lblFolder.Font = $fontBold
$lblFolder.ForeColor = $textMuted
$lblFolder.Location = New-Object System.Drawing.Point(20, 165)
$lblFolder.Size = New-Object System.Drawing.Size(200, 18)

$txtFolder = New-Object System.Windows.Forms.TextBox
$txtFolder.Location = New-Object System.Drawing.Point(20, 185)
$txtFolder.Size = New-Object System.Drawing.Size(445, 28)
$txtFolder.Font = $fontNormal
$txtFolder.BackColor = $panelColor
$txtFolder.ForeColor = $textColor
$txtFolder.BorderStyle = "FixedSingle"

$btnBrowse = New-Object System.Windows.Forms.Button
$btnBrowse.Location = New-Object System.Drawing.Point(475, 184)
$btnBrowse.Size = New-Object System.Drawing.Size(90, 28)
$btnBrowse.Text = "Procurar"
$btnBrowse.FlatStyle = "Flat"
$btnBrowse.BackColor = $panelColor
$btnBrowse.ForeColor = $textColor
$btnBrowse.Font = $fontBold
$btnBrowse.Cursor = [System.Windows.Forms.Cursors]::Hand
$btnBrowse.FlatAppearance.BorderColor = $textMuted
$btnBrowse.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::FromArgb(65, 65, 65)

$btnBrowse.Add_Click({
    $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    $folderBrowser.Description = "Selecione a pasta com os mods (.mcpack, .mcaddon)"
    if ($folderBrowser.ShowDialog() -eq "OK") {
        $txtFolder.Text = $folderBrowser.SelectedPath
        Update-FileCount
    }
})

# ==================== DRAG AND DROP ====================
$form.Add_DragEnter({
    if ($_.Data.GetDataPresent([System.Windows.Forms.DataFormats]::FileDrop)) {
        $_.Effect = [System.Windows.Forms.DragDropEffects]::Copy
    }
})

$form.Add_DragDrop({
    $droppedItems = $_.Data.GetData([System.Windows.Forms.DataFormats]::FileDrop)
    if ($droppedItems.Count -gt 0) {
        $firstItem = $droppedItems[0]
        if (Test-Path $firstItem -PathType Container) {
            $txtFolder.Text = $firstItem
        } else {
            $txtFolder.Text = [System.IO.Path]::GetDirectoryName($firstItem)
        }
        Update-FileCount
    }
})

# ==================== CONTADOR DE ARQUIVOS ====================
$lblFileCount = New-Object System.Windows.Forms.Label
$lblFileCount.Text = "Arraste uma pasta aqui ou clique em Procurar"
$lblFileCount.Font = $fontSmall
$lblFileCount.ForeColor = $textMuted
$lblFileCount.Location = New-Object System.Drawing.Point(20, 218)
$lblFileCount.Size = New-Object System.Drawing.Size(545, 18)

function Update-FileCount {
    if (![string]::IsNullOrWhiteSpace($txtFolder.Text) -and (Test-Path $txtFolder.Text)) {
        $count = (Get-ChildItem -Path $txtFolder.Text -Include *.mcpack, *.mcaddon, *.zip -Recurse -ErrorAction SilentlyContinue).Count
        if ($count -eq 0) {
            $lblFileCount.Text = "Nenhum arquivo de mod encontrado nesta pasta."
            $lblFileCount.ForeColor = $warnColor
        } elseif ($count -eq 1) {
            $lblFileCount.Text = "1 arquivo de mod encontrado."
            $lblFileCount.ForeColor = $successColor
        } else {
            $lblFileCount.Text = "$count arquivos de mod encontrados."
            $lblFileCount.ForeColor = $successColor
        }
    } else {
        $lblFileCount.Text = "Arraste uma pasta aqui ou clique em Procurar"
        $lblFileCount.ForeColor = $textMuted
    }
}

$txtFolder.Add_TextChanged({ Update-FileCount })

# ==================== BOTAO INSTALAR ====================
$btnInstall = New-Object System.Windows.Forms.Button
$btnInstall.Location = New-Object System.Drawing.Point(20, 248)
$btnInstall.Size = New-Object System.Drawing.Size(545, 42)
$btnInstall.Text = "INSTALAR MODS"
$btnInstall.FlatStyle = "Flat"
$btnInstall.BackColor = $accentColor
$btnInstall.ForeColor = [System.Drawing.Color]::White
$btnInstall.Font = $fontButton
$btnInstall.Cursor = [System.Windows.Forms.Cursors]::Hand
$btnInstall.FlatAppearance.BorderSize = 0
$btnInstall.FlatAppearance.MouseOverBackColor = $accentHover

# ==================== BARRA DE PROGRESSO ====================
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(20, 300)
$progressBar.Size = New-Object System.Drawing.Size(545, 6)
$progressBar.Style = "Continuous"
$progressBar.BackColor = $panelColor
$progressBar.ForeColor = $accentColor
$progressBar.Minimum = 0
$progressBar.Maximum = 100
$progressBar.Value = 0

$lblProgress = New-Object System.Windows.Forms.Label
$lblProgress.Text = ""
$lblProgress.Font = $fontSmall
$lblProgress.ForeColor = $textMuted
$lblProgress.Location = New-Object System.Drawing.Point(20, 308)
$lblProgress.Size = New-Object System.Drawing.Size(545, 16)
$lblProgress.TextAlign = [System.Drawing.ContentAlignment]::MiddleRight

# ==================== LOG ====================
$lblLog = New-Object System.Windows.Forms.Label
$lblLog.Text = "LOG"
$lblLog.Font = $fontBold
$lblLog.ForeColor = $textMuted
$lblLog.Location = New-Object System.Drawing.Point(20, 328)
$lblLog.Size = New-Object System.Drawing.Size(100, 18)

$txtLog = New-Object System.Windows.Forms.RichTextBox
$txtLog.Location = New-Object System.Drawing.Point(20, 348)
$txtLog.Size = New-Object System.Drawing.Size(545, 220)
$txtLog.Font = $fontLog
$txtLog.BackColor = $logBg
$txtLog.ForeColor = $textColor
$txtLog.BorderStyle = "None"
$txtLog.ReadOnly = $true
$txtLog.ScrollBars = "Vertical"
$txtLog.DetectUrls = $false

# ==================== STATUS BAR ====================
$statusPanel = New-Object System.Windows.Forms.Panel
$statusPanel.Location = New-Object System.Drawing.Point(0, 580)
$statusPanel.Size = New-Object System.Drawing.Size(600, 30)
$statusPanel.BackColor = $panelColor

$lblStatus = New-Object System.Windows.Forms.Label
$lblStatus.Text = "Pronto"
$lblStatus.Font = $fontSmall
$lblStatus.ForeColor = $textMuted
$lblStatus.Location = New-Object System.Drawing.Point(15, 6)
$lblStatus.Size = New-Object System.Drawing.Size(300, 18)
$lblStatus.BackColor = [System.Drawing.Color]::Transparent

$lblVersion = New-Object System.Windows.Forms.Label
$lblVersion.Text = "v2.0"
$lblVersion.Font = $fontSmall
$lblVersion.ForeColor = [System.Drawing.Color]::FromArgb(80, 80, 80)
$lblVersion.Location = New-Object System.Drawing.Point(530, 6)
$lblVersion.Size = New-Object System.Drawing.Size(50, 18)
$lblVersion.TextAlign = [System.Drawing.ContentAlignment]::MiddleRight
$lblVersion.BackColor = [System.Drawing.Color]::Transparent

$statusPanel.Controls.Add($lblStatus)
$statusPanel.Controls.Add($lblVersion)

# ==================== FUNCOES DE LOG ====================
function Log-Message {
    param(
        [string]$message,
        [System.Drawing.Color]$color = $textColor
    )
    $timestamp = Get-Date -Format "HH:mm:ss"
    $txtLog.SelectionStart = $txtLog.TextLength
    $txtLog.SelectionLength = 0
    $txtLog.SelectionColor = [System.Drawing.Color]::FromArgb(80, 80, 80)
    $txtLog.AppendText("[$timestamp] ")
    $txtLog.SelectionStart = $txtLog.TextLength
    $txtLog.SelectionLength = 0
    $txtLog.SelectionColor = $color
    $txtLog.AppendText($message + "`r`n")
    $txtLog.ScrollToCaret()
    $form.Refresh()
}

function Log-Success { param([string]$msg) Log-Message $msg $successColor }
function Log-Error   { param([string]$msg) Log-Message $msg $errorColor }
function Log-Warn    { param([string]$msg) Log-Message $msg $warnColor }
function Log-Info    { param([string]$msg) Log-Message $msg $infoColor }

# ==================== LOGICA DE INSTALACAO ====================
$btnInstall.Add_Click({
    if ([string]::IsNullOrWhiteSpace($txtFolder.Text) -or !(Test-Path $txtFolder.Text)) {
        [System.Windows.Forms.MessageBox]::Show(
            "Por favor, selecione uma pasta valida contendo os mods.",
            "Pasta invalida",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Warning
        )
        return
    }

    $btnInstall.Enabled = $false
    $btnInstall.BackColor = [System.Drawing.Color]::FromArgb(100, 100, 100)
    $btnInstall.Text = "INSTALANDO..."
    $btnBrowse.Enabled = $false
    $btnVerify.Enabled = $false
    $txtLog.Clear()
    $progressBar.Value = 0
    $script:installedCount = 0
    $script:errorCount = 0

    # Contar packs ANTES da instalacao
    $script:resBefore = if (Test-Path (Join-Path $env:LOCALAPPDATA "Packages")) {
        $mcPkg2 = Get-ChildItem "$env:LOCALAPPDATA\Packages" -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like "*Minecraft*" -and $_.Name -like "*8wekyb3d8bbwe*" } | Select-Object -First 1
        if ($mcPkg2) { $rp = Join-Path $mcPkg2.FullName "LocalState\games\com.mojang\resource_packs"; if (Test-Path $rp) { (Get-ChildItem $rp -Directory -ErrorAction SilentlyContinue).Count } else { 0 } } else { 0 }
    } else { 0 }
    $script:behBefore = if (Test-Path (Join-Path $env:LOCALAPPDATA "Packages")) {
        $mcPkg2 = Get-ChildItem "$env:LOCALAPPDATA\Packages" -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like "*Minecraft*" -and $_.Name -like "*8wekyb3d8bbwe*" } | Select-Object -First 1
        if ($mcPkg2) { $bp = Join-Path $mcPkg2.FullName "LocalState\games\com.mojang\behavior_packs"; if (Test-Path $bp) { (Get-ChildItem $bp -Directory -ErrorAction SilentlyContinue).Count } else { 0 } } else { 0 }
    } else { 0 }

    $lblStatus.Text = "Verificando diretorios..."
    Log-Info "Iniciando instalacao de mods..."

    # Verificar pasta do Minecraft (busca independente de maiusculas/minusculas)
    $packagesDir = "$env:LOCALAPPDATA\Packages"
    $minecraftPackage = Get-ChildItem -Path $packagesDir -Directory -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -like "*Minecraft*" -and $_.Name -like "*8wekyb3d8bbwe*" } |
        Select-Object -First 1

    if ($null -eq $minecraftPackage) {
        Log-Error "ERRO: Pasta do Minecraft Bedrock nao encontrada!"
        Log-Warn "Certifique-se de ter o jogo instalado e aberto ao menos uma vez."
        $btnInstall.Enabled = $true
        $btnInstall.BackColor = $accentColor
        $btnInstall.Text = "INSTALAR MODS"
        $btnBrowse.Enabled = $true
        $lblStatus.Text = "Erro: Minecraft nao encontrado"
        $lblStatus.ForeColor = $errorColor
        return
    }

    $mojangDir = Join-Path $minecraftPackage.FullName "LocalState\games\com.mojang"
    if (!(Test-Path $mojangDir)) {
        Log-Warn "Pasta com.mojang nao encontrada. Criando estrutura de diretorios..."
        try {
            New-Item -ItemType Directory -Path $mojangDir -Force | Out-Null
            Log-Info "Pasta com.mojang criada com sucesso."
        } catch {
            Log-Error "Nao foi possivel criar a pasta com.mojang: $($_.Exception.Message)"
            $btnInstall.Enabled = $true
            $btnInstall.BackColor = $accentColor
            $btnInstall.Text = "INSTALAR MODS"
            $btnBrowse.Enabled = $true
            $lblStatus.Text = "Erro ao criar pastas do Minecraft"
            $lblStatus.ForeColor = $errorColor
            return
        }
    }

    Log-Info "Pasta encontrada: $($minecraftPackage.Name)"
    Log-Success "Pasta do Minecraft pronta."

    $behaviorDir = Join-Path $mojangDir "behavior_packs"
    $resourceDir = Join-Path $mojangDir "resource_packs"

    if (!(Test-Path $behaviorDir)) { New-Item -ItemType Directory -Path $behaviorDir | Out-Null }
    if (!(Test-Path $resourceDir)) { New-Item -ItemType Directory -Path $resourceDir | Out-Null }

    $files = Get-ChildItem -Path $txtFolder.Text -Include *.mcpack, *.mcaddon, *.zip -Recurse -ErrorAction SilentlyContinue

    if ($files.Count -eq 0) {
        Log-Warn "Nenhum arquivo .mcpack ou .mcaddon encontrado na pasta."
        $btnInstall.Enabled = $true
        $btnInstall.BackColor = $accentColor
        $btnInstall.Text = "INSTALAR MODS"
        $btnBrowse.Enabled = $true
        $lblStatus.Text = "Nenhum mod encontrado"
        return
    }

    $totalFiles = $files.Count

    Log-Info "Encontrados $totalFiles arquivos para processar."
    Log-Message "----------------------------------------" $textMuted

    $currentFile = 0
    foreach ($file in $files) {
        $currentFile++
        $percent = [math]::Round(($currentFile / $totalFiles) * 100)
        $progressBar.Value = $percent
        $lblProgress.Text = "$currentFile / $totalFiles ($percent%)"
        $lblStatus.Text = "Processando: $($file.Name)"

        Log-Info "[$currentFile/$totalFiles] $($file.Name)"

        $tempDir = Join-Path $env:TEMP ("mcmod_" + [guid]::NewGuid().ToString().Substring(0,8))
        New-Item -ItemType Directory -Path $tempDir | Out-Null

        try {
            [System.IO.Compression.ZipFile]::ExtractToDirectory($file.FullName, $tempDir)

            # Funcao recursiva para processar manifestos
            function Process-Pack($packDir) {
                $manifestPath = Join-Path $packDir "manifest.json"
                if (Test-Path $manifestPath) {
                    try {
                        $rawContent = Get-Content $manifestPath -Raw -Encoding UTF8
                        # Remove BOM se existir
                        $rawContent = $rawContent -replace '^\xEF\xBB\xBF', ''
                        $manifestContent = $rawContent | ConvertFrom-Json
                        $type = $manifestContent.modules[0].type

                        # Limpar nome para ser pasta segura
                        $packName = $manifestContent.header.name -replace '[<>:"/\\|?*]', '_'
                        if ([string]::IsNullOrWhiteSpace($packName)) {
                            $packName = [guid]::NewGuid().ToString().Substring(0,8)
                        }

                        if ($type -eq "resources" -or $type -eq "client_data") {
                            $dest = Join-Path $resourceDir $packName
                            if (Test-Path $dest) { Remove-Item $dest -Recurse -Force | Out-Null }
                            Copy-Item -Path $packDir -Destination $dest -Recurse
                            Log-Success ("  > [Textura/Recurso] " + $packName)
                            $script:installedCount++
                        }
                        elseif ($type -eq "data" -or $type -eq "server_data" -or $type -eq "script") {
                            $dest = Join-Path $behaviorDir $packName
                            if (Test-Path $dest) { Remove-Item $dest -Recurse -Force | Out-Null }
                            Copy-Item -Path $packDir -Destination $dest -Recurse
                            Log-Success ("  > [Comportamento] " + $packName)
                            $script:installedCount++
                        }
                        elseif ($type -eq "world_template") {
                            Log-Warn ("  > [Mundo] " + $packName + " - mundos nao sao instalados automaticamente.")
                        }
                        else {
                            $dest = Join-Path $resourceDir $packName
                            if (Test-Path $dest) { Remove-Item $dest -Recurse -Force | Out-Null }
                            Copy-Item -Path $packDir -Destination $dest -Recurse
                            Log-Warn ("  > [Tipo: " + $type + "] " + $packName + " - instalado como recurso")
                            $script:installedCount++
                        }
                    } catch {
                        Log-Error ("  > Erro ao ler manifest.json: " + $_.Exception.Message)
                        $script:errorCount++
                    }
                }
                else {
                    # Pode ser um mcaddon que tem subpastas com packs
                    $subDirs = Get-ChildItem -Path $packDir -Directory -ErrorAction SilentlyContinue
                    if ($subDirs.Count -gt 0) {
                        foreach ($subDir in $subDirs) {
                            Process-Pack $subDir.FullName
                        }
                    } else {
                        Log-Warn "  > Sem manifest.json encontrado, pulando..."
                        $script:errorCount++
                    }
                }
            }

            Process-Pack $tempDir

        } catch {
            Log-Error ("  > Erro ao extrair: " + $_.Exception.Message)
            $script:errorCount++
        } finally {
            if (Test-Path $tempDir) { Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue | Out-Null }
        }
    }

    Log-Message "----------------------------------------" $textMuted
    $progressBar.Value = 100

    # Resumo final
    $installed = $script:installedCount
    $errors = $script:errorCount
    if ($errors -eq 0) {
        Log-Success "Instalacao concluida! $installed pack(s) instalado(s) com sucesso."
        $lblStatus.Text = "Concluido - $installed pack(s) instalado(s)"
        $lblStatus.ForeColor = $successColor
    } else {
        Log-Warn "Instalacao concluida com avisos. $installed instalado(s), $errors erro(s)."
        $lblStatus.Text = "Concluido - $installed ok, $errors erro(s)"
        $lblStatus.ForeColor = $warnColor
    }

    $btnInstall.Enabled = $true
    $btnInstall.BackColor = $accentColor
    $btnInstall.Text = "INSTALAR MODS"
    $btnBrowse.Enabled = $true
    $btnVerify.Enabled = $true

    # Atualizar cards com contagem APOS instalacao
    Refresh-Stats

    # Calcular novos totais para o resumo
    $resAfter  = [int]$lblResourceCount.Text.Split(' ')[0]
    $behAfter  = [int]$lblBehaviorCount.Text.Split(' ')[0]
    $resNew = $resAfter - $script:resBefore
    $behNew = $behAfter - $script:behBefore

    Log-Info "Texturas: $($script:resBefore) -> $resAfter (+$resNew)"
    Log-Info "Comportamentos: $($script:behBefore) -> $behAfter (+$behNew)"

    $resultMsg = "Instalacao concluida!`n`n" +
        "Packs instalados nesta sessao: $installed`n" +
        "Erros: $errors`n`n" +
        "--- Situacao Atual ---`n" +
        "Texturas: $resAfter packs  (+ $resNew novos)`n" +
        "Comportamentos: $behAfter packs  (+ $behNew novos)`n`n" +
        "Abra o Minecraft e ative os packs no seu mundo."
    [System.Windows.Forms.MessageBox]::Show(
        $resultMsg,
        "Instalacao Concluida",
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Information
    ) | Out-Null
})

# ==================== MONTAR FORMULARIO ====================
$form.Controls.Add($headerPanel)
$form.Controls.Add($statsPanel)
$form.Controls.Add($lblFolder)
$form.Controls.Add($txtFolder)
$form.Controls.Add($btnBrowse)
$form.Controls.Add($lblFileCount)
$form.Controls.Add($btnInstall)
$form.Controls.Add($progressBar)
$form.Controls.Add($lblProgress)
$form.Controls.Add($lblLog)
$form.Controls.Add($txtLog)
$form.Controls.Add($statusPanel)

$form.ShowDialog() | Out-Null
