# Delete files from folder older than any days

With this PowerShell script you can delete files from folder within a certain time period.

You just have to define how many days you want to filter to delete files on the line below.

```shell
# Defines how many days the files can stay in the defined directory
$limit = (Get-Date).AddDays(-7)
```

You also need to paste the folder path where the files are located on the line below.

```shell
# Defines the destination directory to clean files
$path = "Put your folder path here"
```
