Add-Type -AssemblyName System.Windows.Forms
Add-Type -Name ConsoleUtils -Namespace WPIA -MemberDefinition @'
    [DllImport("Kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'@
 
#Hide PowerShell Window
#$hWnd = [WPIA.ConsoleUtils]::GetConsoleWindow()
#[WPIA.ConsoleUtils]::ShowWindow($hWnd, 0)
 
 
Clear-Host
 
$WShell = New-Object -ComObject "Wscript.Shell"
$PlusOrMinus = 1
$i = 0
 
while ($true)
{
    $i++
    #Press Key
    $WShell.SendKeys("{SCROLLLOCK}")
    Start-Sleep -Milliseconds 100
    $WShell.SendKeys("{SCROLLLOCK}")
   
    #Move Mouse
    $p = [System.Windows.Forms.Cursor]::Position
    $x = $p.X + $PlusOrMinus
    $y = $p.Y + $PlusOrMinus
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
 
    Write-Host "BOOP :) $i"
 
    #Sleep
    $PlusOrMinus *= -1
    $WaitTime = Get-Random -Minimum 15000 -Maximum 30000 # 2-5 Minutes
    Start-Sleep -Milliseconds $WaitTime  
}
