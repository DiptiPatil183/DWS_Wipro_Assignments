#All Commands 
# Lists all available PowerShell commands, including cmdlets, functions,and aliases
 Show-Command

# Gets the services on a local or remote computer
 Get-Service 

# Gets a consolidated object of system and operating system properties.
 Get-ComputerInfo 

# Retrieves information about running processes on the system
 Get-Process 

# Gets the modules that have been imported or that can be imported into the current session.
 Get-Module 

# Retrives information of specific process like winlogo
Get-Process -Name winlogo 

# Gets the execution policies for the current session.
Get-ExecutionPolicy 

# This command shows only those running processes that have used more than 1 second of CPU time. 
Get-Process | Where-Object {$_.CPU -gt 1} 

# This command shows only the processes that are using more than 1 second of CPU time and more than 10 MB of memory.
Get-Process | Where-Object {$_.CPU -gt 1 -and $_.WorkingSet -gt 10mb} 

# This command displays the 10 latest events from the Application log
Get-EventLog -LogName Application -Newest 10 

#This command checks whether the folder "DavidC" exists inside "C:\Documents and Settings". True if the folder exists OR False if it does not
Test-Path -Path "C:\Documents and Settings\DavidC" 

# This command creates a new PowerShell drive named "Public"
New-PSDrive -Name "Public" -PSProvider "FileSystem" -Root "\\Server01\Public" 
 
# This command saves the list of running processes into a specified file
Get-Process | Out-File E:\wiprofiledwc\processfile 

# This command collects your computer’s network configuration details and saves them into given location file 
Get-NetIPConfiguration | Out-File E:\wiprofiledwc\configurationfile 

# This command gets a list of all file system drives on your computer and writes that list to a text file at the specified location.
Get-PSDrive -PSProvider FileSystem |Out-File E:\wiprofiledwc\datafile.txt 

# This command gets a complete list of all PowerShell commands and stores it in a text file at the specified location.
Get-Command | Out-File E:\wiprofiledwc\datafilea.txt

#  This command gets the list of files and folders in the current location and writes it to a text file.
Get-ChildItem | Out-File E:\wiprofiledwc\file.txt 

# This command gets a list of all Windows services and saves it into a text file at the specified location.
Get-Service |Out-File E:\wiprofiledwc\servicefile.txt 

# This command gets all services that are not currently running and saves their details into a text file
Get-Service |Where status -ne Running | Out-File E:\wiprofiledwc\runningservicefile.txt 
 
# This command simply prints "Hello Everyone" on your PowerShell screen.
Write-Host "Hello Everyone" 

# This command asks the user to type their name and waits for the input
Read-Host "Please Enter your name " 

#  The command asks for your name, then says: "Hello Lets welcome [YourName] in DWS Session"
$name = Read-Host "Please Enter Name " 
Write-Output "Hello Lets welcome $name in DWS Session " 

# Format Table : This command lists running processes and shows just their name, CPU time used, and when they started,in a table format
Get-Process | Format-Table -Property Name, CPU, StartTime 

# Format List : This command lists all services, with service name, whether they are running or stopped, and display name, in a list.
Get-Service | Format-List -Property Name, Status , DisplayName 


# Format Wide:This command shows the names of files and folders in the current folder, neatly arranged in 3 columns side-by-side. 
Get-ChildItem | Format-Wide -Column 3 


# Pipeline :
# This command finds all processes using more than 1 second of CPU, sorts them in descending order of CPU usage, and shows just their name and CPU time.
Get-Process | Where-Object {$_.CPU -gt 1 } | Sort-Object CPU -Descending | Select-Object Name , CPU  


# Conditional statement 
$age = 17 
if($age -gt 18) 
{ 
    Write-Host "Eligible to vote " 
} 
elseif($age -lt 18 ) 
{  
    Write-Host "Not eligible to vote " 
} 


# Variables  
$name = "Omkar" 
$age = 20 
$isValid = $true 
 
 # Array  
 # Creates an array named $myArray with 5 items:
   $myArray = 10,56,78,"Banana" ,"Mango "
 # Gets the first item in the array, which is 10. 
     $myArray[0] 
 # Gets the last item in the array, which is "Mango ".
   $myArray[-1] 
 # Gets the second last item, which is "Banana".
   $myArray[-2] 
 # Adds the string "Orange" to the end of the array.
   $myArray+="Orange" 
 
# Switch : The switch statement is used to test a value against multiple conditions and run matching code blocks
$day = "Wednesday" 
switch ($day){ 
 "Monday"{Write-Host "Start of the week "} 
 "Saturday"{Write-Host "End of the week "} 
 default{Write-Host "Mid of Week "}} 


# String Formatting 
 $name = "Atharav " 
 $age = 20 
 " My name is {0} and I am {1} years old " -f $name , $age  


 # -eq checks if both strings are exactly equal 
 'hello' -eq ' Hello ' 
 "Hello "-eq "Hello " 
 
 # Looping  
 for($i=1 ; $i -le 5 ; Si++) 
 { 
    Write-Host "Iteration :$i" 
 } 
 
# Execute MSI 
 # This command is used to install an MSI package
  Execute-MSI -Action 'Install' -Path 'Adobe_FlashPlayer_11.2.202.233_x64_EN.msi' 
# Installs an MSI, applying a transform and overriding the default MSI toolkit parameters
 Execute-MSI -Action 'Install' -Path 'Adobe_FlashPlayer_11.2.202.233_x64_EN.msi' -Transform 'Adobe_FlashPlayer_11.2.202.233_x64_EN_01.mst' -Parameters '/QN' 
# Uninstalls an MSI using a product code
 Execute-MSI -Action 'Uninstall' -Path '{26923b43-4d38-484f-9b9e-de460746276c}' 
# Installs an MSP
 Execute-MSI -Action 'Patch' -Path 'Adobe_Reader_11.0.3_EN.msp' 
# This command installs an MSI application (whose path is stored in $AppMSIName), skips the "already installed" check, stops on errors, and saves a log file with the name format: AppName_MSI.log.
 Execute-MSI -Action Install -Path $AppMSIName -SkipMSIAlreadyInstalledCheck -ContinueOnError $False -LogName "${AppMSIName}_MSI" 
 
# Execute Process: 
# If the file is in the "Files" directory of the App Deploy Toolkit, only the file name needs to be specified.
Execute-Process -Path 'uninstall_flash_player_64bit.exe' -Parameters '/uninstall' -WindowStyle 'Hidden'
 
Execute-Process -Path "$dirFiles\Bin\setup.exe" -Parameters '/S' -WindowStyle 'Hidden' 
Execute-Process -Path 'setup.exe' -Parameters '/S' -IgnoreExitCodes '1,2' 

# Launch InstallShield "setup.exe" from the ".\Files" sub-directory and force log files to the logging folder.
Execute-Process -Path 'setup.exe' -Parameters "-s -f2`"$configToolkitLogDir\$installName.log`"" 

# Launch InstallShield "setup.exe" with embedded MSI and force log files to the logging folder.
Execute-Process -Path 'setup.exe' -Parameters "/s /v`"ALLUSERS=1 /qn /L* `"$configToolkitLogDir\$installName.log`"`"" 
 
 
# Execute MSP 

Execute-MSP -Path 'Adobe_Reader_11.0.3_EN.msp' 
Execute-MSP -Path 'AcroRdr2017Upd1701130143_MUI.msp' -AddParameters 'ALLUSERS=1' 

# Copy File 
# Copy all of the files in a folder to a destination folder.
 Copy-File -Path "$dirSupportFiles\*.*" -Destination "$envTemp\tempfiles" 
# Copy the specific mentioned files in a folder to a destination folder.
 Copy-File -Path "$dirSupportFiles\MyApp.ini" -Destination "$envWinDir\MyApp.ini" 
 
# Execute MSUpdates 
# This command installs all Microsoft update files (like .msu) from the folder: C:\Deploy\MSUpdates
Install-MSUpdates -Directory "$dirFiles\MSUpdates" 
 
# Set-ActiveSetup 
Set-ActiveSetup -StubExePath 'C:\Users\Public\Company\ProgramUserConfig.vbs' -Arguments '/Silent' -Description 'Program User Config' -Key 'ProgramUserConfig' -Locale 'en' 
Set-ActiveSetup -StubExePath "$envWinDir\regedit.exe" -Arguments "/S `"%SystemDrive%\Program Files (x86)\PS App Deploy\PSAppDeployHKCUSettings.reg`"" -Description 'PS App Deploy Config' -Key 'PS_App_Deploy_Config' -ContinueOnError $true 
 
# Get-RegistryKey
#  Retrieves value names and value data for a specified registry key or optionally, a specific value.
Get-RegistryKey -Key 'HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{1AD147D0BE0E-3D6C-AC11-64F6DC4163F1}' 
 
# Set INIValue
# Opens an INI file and sets the value of the specified section and key.
Set-IniValue -FilePath "C:\Windows\Path\to\my.ini" -Section 'MySection' -Key 'MyKey' -Value 'MyValue' 
 
#Create/Delete/Modify Registries 
 
# Create new key : This command creates a new registry key 
New-Item -Path "HKLM:\Software\MyCompany" -Type Directory -ErrorAction SilentlyContinue 
 
# Delete a Key : This command delete a  registry key 
Remove-Item -Path "HKLM:\Software\MyCompany" -Recurse -Force -ErrorAction SilentlyContinue 
 
# Set a registry value  :This command  updates a registry value.
Set-ItemProperty  -Path "HKLM:\Software\MyCompany\MyKey" -Name "MyValue" -Value "MyData" 
 
# Get a registry value :This command gives a registry value.
Get-ItemProperty  -Path "HKLM:\Software\MyCompany\MyKey" -Name "MyValue" 

#Start/Stop Services 
# Gets the services on a local or remote computer.
Start Service  
# Start the service having name YourServiceName
Start-Service -Name "YourServiceName" 
Start-Service -Name "wuauserv". 

# This Command Stop the service
Stop Service 
# This Command stop the specified name  service 
Stop-Service -Name "YourServiceName" 
Stop-Service -Name "wuauserv" 
# This Command stop the service if it has a dependent service
Stop-Service -Name "YourServiceName" -Force 
 
# Start Sevice with dependencies 
# Start service use the Start-ServiceAndDependencies function to start a service and dependent service
Start-ServiceAndDependencies  -Name "YourServiceName"  
Start-ServiceAndDependencies  -Name "wuauserv" 
 
# Stop Service with dependencies 
#  Stop service use the Stop-ServiceAndDependencies function to stop a service and dependent service
Stop-ADTServiceAndDependencies  -Name "YourServiceName" 
Stop-ADTServiceAndDependencies  -Name "wuauserv" 

# Displays a custom installation prompt with the toolkit branding and optional buttons.
Show-InstallationPrompt -Message 'Do you want to proceed with the installation?' -ButtonRightText 'Yes' -ButtonLeftText 'No'

# Prompt the user to close Internet Explorer, Word and Excel.
Show-InstallationWelcome -CloseApps 'iexplore,winword,excel'

# Uses the default status message from the XML configuration file.
Show-InstallationProgress

# Display a custom dialog box with optional title, buttons, icon and timeout.
Show-DialogBox -Title 'Installed Complete' -Text 'Installation has completed. Please click OK and restart your computer.' -Icon 'Information'

# Displays a balloon tip notification in the system tray.
Show-BalloonTip -BalloonTipText 'Installation Started' -BalloonTipTitle 'Application Name'