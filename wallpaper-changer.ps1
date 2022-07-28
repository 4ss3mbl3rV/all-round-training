$command = {
Invoke-WebRequest -Uri https://wallpapersafari.com/download/qRHscL/ -outFile "$env:TEMP\pleasedontdeleteme.jpg"
$wallpaper_path="$env:TEMP\pleasedontdeleteme.jpg"
function Set-Wallpaper($MyWallpaper){
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@

add-type $code 
[Win32.Wallpaper]::SetWallpaper($MyWallpaper)
}
Set-Wallpaper($wallpaper_path)
}.toString()

$byte = [System.Text.Encoding]::Unicode.GetBytes($command)
$encodedCommand = [Convert]::ToBase64String($byte)

powershell -noprofile -EncodedCommand $encodedCommand