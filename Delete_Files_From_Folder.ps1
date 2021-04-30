# --------------------------------------------------------------------------------------#
# Title: Delete files older than seven days
# Author: Guilherme Matheus
# Date: Script created on 30.04.2021
# Script and data info: This script clean up a folder with files older than 1 week
# --------------------------------------------------------------------------------------#

# To execute the script without agreeing with the execution policy
Set-ExecutionPolicy Bypass -Scope Process

# Defines how many days the files can stay in the defined directory
$limit = (Get-Date).AddDays(-7)

# Defines the destination directory to clean files
$path = "Put your folder path here"

# Delete files older than the $limit variable.
Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force

# Delete any empty directories left behind after deleting the old files.
Get-ChildItem -Path $path -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse