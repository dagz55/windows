# PowerShell script to move and resize the pagefile
# Run as Administrator

# Disable automatic management of the paging file
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'PagingFiles' -Value ' '

# Set pagefile on the new drive (U: in this example)
$newDrive = "U:\\pagefile.sys"
$sizeGB = 32 # 32 GB
$sizeMB = $sizeGB * 1024 # Convert GB to MB
$newPageFile = "$newDrive $sizeMB $sizeMB"

# Set pagefile on the new drive
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'PagingFiles' -Value $newPageFile

# Disable pagefile on C: drive
$noPageFile = "C:\\pagefile.sys 0 0"
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' -Name 'PagingFiles' -Value $newPageFile

# Restart to apply changes
Restart-Computer
