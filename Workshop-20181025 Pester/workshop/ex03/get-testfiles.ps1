function Get-TestFiles {


    [cmdletbinding()]
    Param (
        [parameter(Mandatory=$true)]
        [string]
        $Path, 

        [parameter(Mandatory=$false)]
        [string]
        $Filter="*.tmp"
    )

    return Get-childItem -Path C:\Windows\Temp -Filter $filter

}