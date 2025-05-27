Show-Command
Get-Service
Get-ComputerInfo
Get-Process
Get-Process -Name winlogo
Get-Process | Where-Object {$_.CPU -gt 1}
Get-Process | Where-Object {$_.CPU -gt 1 -and $_.WorkingSet -gt 10mb}
Get-EventLog -LogName Application -Newest 10

Get-Process | Out-File E:\wiprofiledwc\processfile
Get-NetIPConfiguration | Out-File E:\wiprofiledwc\configurationfile
Get-PSDrive -PSProvider FileSystem |Out-File E:\wiprofiledwc\datafile.txt
Get-Command | Out-File E:\wiprofiledwc\datafilea.txt
Get-ChildItem | Out-File E:\wiprofiledwc\file.txt
Get-Service |Out-File E:\wiprofiledwc\servicefile.txt
Get-Process | Format-Table -Property Name, CPU, StartTime
Get-Service |Where status -ne Running | Out-File E:\wiprofiledwc\runningservicefile.txt

Write-Host "Hello Everyone"
Read-Host "Please Enter your name "

$name = Read-Host "Please Enter Name "
Write-Output "Hello Lets welcome $name in DWS Session "

Get-Service | Format-List -Property Name, Status , DisplayName

#Pipeline
Get-Process | Where-Object {$_.CPU -gt 1 } | Sort-Object CPU -Descending | Select-Object Name , CPU 

$age = 17
if($age -gt 18)
{
    Write-Host "Eligible to vote "
}
elseif($age -lt 18 )
{ 
    Write-Host "Not eligible to vote "
}

#Variables 
$name = "Omkar"
$age = 20
$isValid = $true

#Array 
$myArray = 10,56,78,"Banana" ,"Mango "
$myArray[0]
$myArray[-1]
$myArray[-2]
$myArray+="Orange"

#Switch
$day = "Wednesday"
switch ($day)
{
 "Monday"{Write-Host "Start of the week "}
 "Saturday"{Write-Host "End of the week "}
 default{Write-Host "Mid of Week "}
 }

 $name = "Atharav "
 $age = 20
 " My name is {0} and I am {1} years old " -f $name , $age 

 'hello' -eq ' Hello '
 "Hello "-eq "Hello "