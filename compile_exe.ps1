$currentPath = $PSScriptRoot
if ([string]::IsNullOrEmpty($currentPath)) {
    $currentPath = (Get-Location).Path
}

$ps1Path = Join-Path $currentPath "InstaladorMods.ps1"
$exePath = Join-Path $currentPath "InstaladorMods.exe"
$csPath = Join-Path $currentPath "wrapper.cs"

# Criar o código C# (string literal para evitar conflito de aspas)
$csCode = @'
using System;
using System.Diagnostics;
using System.IO;
using System.Reflection;

class Program
{
    static void Main()
    {
        string tempFile = Path.Combine(Path.GetTempPath(), "InstaladorMods_" + Guid.NewGuid().ToString() + ".ps1");
        
        using (Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("InstaladorMods.ps1"))
        using (FileStream fileStream = new FileStream(tempFile, FileMode.Create))
        {
            stream.CopyTo(fileStream);
        }
        
        ProcessStartInfo psi = new ProcessStartInfo();
        psi.FileName = "powershell.exe";
        psi.Arguments = "-ExecutionPolicy Bypass -WindowStyle Hidden -File \"" + tempFile + "\"";
        psi.WindowStyle = ProcessWindowStyle.Hidden;
        psi.CreateNoWindow = true;
        
        Process p = Process.Start(psi);
        p.WaitForExit();
        
        try { File.Delete(tempFile); } catch {}
    }
}
'@

[System.IO.File]::WriteAllText($csPath, $csCode)

# Encontrar csc.exe
$csc = "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe"
if (-Not (Test-Path $csc)) {
    $csc = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe"
}

$iconPath = Join-Path $currentPath "icon.ico"

# Compilar como Windows Executable (sem console) embutindo o ps1 como recurso e usando icone
& $csc /target:winexe /win32icon:"$iconPath" /out:"$exePath" /resource:"$ps1Path,InstaladorMods.ps1" "$csPath"

# Limpar arquivo C#
Remove-Item "$csPath" -Force
