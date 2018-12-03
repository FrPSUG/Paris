# test argument type 
function test-argumentType {

    [CmdletBinding()]
    Param(
        [Int]
        $MyParam
    )

    write-host $MyParam

}

# Validate Set 

function Get-IceCream {

    [CmdletBinding()]
    Param(
        [ValidateSet("Fraise","Vanille","Pistache")]
        [String]
        $MyParam
    )

    write-host $MyParam

}

# Validate Script 
function  get-MyDate {

    [CmdletBinding()]
    Param(
        [parameter()]
        [ValidateScript({$_ -ge (Get-Date)})]
        [DateTime]
        $MyParam
    )

    write-host $MyParam 
}

# Validate Range 
function  get-MyRange {

    [CmdletBinding()]
    Param(
        [parameter()]
        [ValidateRange(1,15)]
        [int]
        $MyParam
    )

    write-host $MyParam 
}

function get-Mandatory {

    [CmdletBinding()]
    Param(
        [parameter(Mandatory=$true)]
        [String]
        $MyParam
    )

    write-host $MyParam 

}

function test-MyAlias {



    [CmdletBinding()]
    Param(
        [parameter(Mandatory=$true)]
        [alias("Param","TheParam")]
        [String]
        $MyParam
    )

    write-host $MyParam 
}



function test-ParamPipeline {
    [CmdletBinding()]
    param (
    [Parameter(ValueFrompipeline = $true)]
        [string[]]
        $MyParam
    )

    foreach ($Item in $MyParam) {
        Write-Host "Item in MyParam $($Item)"
    }

}

function Get-Something {
    [CmdletBinding()]
    Param (
    [Parameter(ParameterSetName = 'ByLogin')]
    [string]$Username,
    [Parameter(ParameterSetName = 'ByLogin')]
    [PSCredential]$Pass,
    [Parameter(ParameterSetName = 'ByToken')]
    [PSSession]$Token
    )
    # ...
}


$Splatte  = @{
    Path = 'C:\Temp'
    Filter = '*.ps1'
    }
    Get-ChildItem @ParamSplat




