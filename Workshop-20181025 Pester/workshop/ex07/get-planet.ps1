function Get-Planet 
{

    [CmdletBinding()]
    param (
        [parameter(Mandatory = $true)]
        [String]
        $Name,

        [parameter(Mandatory = $false)]
        [Int]
        $Population
    )



  $planets = @(
    @{ Name = 'Mercury'; Population = 0 }
    @{ Name = 'Venus';   Population = 0 }
    @{ Name = 'Earth';   Population = 7.5e9 }
    @{ Name = 'Mars';    Population = 0 }
    @{ Name = 'Jupiter'; Population = 0 }
    @{ Name = 'Saturn';  Population = 0 }
    @{ Name = 'Uranus';  Population = 0 }
    @{ Name = 'Neptune'; Population = 0 }
  ) 

  foreach ($planet in $Planets) {

        if ($planet.name -eq $Name) {
            Return $planet.Poplation
        }

  }
}



