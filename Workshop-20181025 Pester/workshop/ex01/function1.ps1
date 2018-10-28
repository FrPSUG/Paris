function Add-OneNumber {

    [CmdletBinding()]
    param (
        [parameter(Mandatory = $true)]
        [int]
        $Numnber
    )

    return 1 + $Numnber

}