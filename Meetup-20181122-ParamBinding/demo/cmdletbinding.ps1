function get-something {

    [CmdletBinding(ConfirmImpact="medium",
    DefaultParameterSetName="Set1",
    HelpURI="http://omiossec.github.io/help",
    SupportsPaging=$false,
    SupportsShouldProcess=$true,
    PositionalBinding=$true)]
    
    Param(
        $MyFirstParam
    )

}


