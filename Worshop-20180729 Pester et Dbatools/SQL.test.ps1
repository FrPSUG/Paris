Import-Module dbatools


$ExcludedDatabase = @("model","master","msdb")

$DatabaseServers = @("ganymede")




Describe "SQL Checkup" {


    # Verifier qu'un Backup a été fait sur l'ensemble des bases
    # On test que toutes les bases ont bien été backuper dans les 24 dernières heures
    context "Last Backup" {

        foreach($Server in $DatabaseServers) {

            $BackupRessults =  get-DbaLastBackup -ExcludeDatabase $ExcludedDatabase  -SqlInstance $Server

            foreach ($ServerResult in $BackupRessults) {
                It "$($ServerResult.Database) on $($ServerResult.SqlInstance) Backup Should be less than 24h old" {
                    [datetime]$ServerResult.LastFullBackup| Should BeGreaterThan (Get-Date).AddHours(24)
                }

            }

        }

    }
            

    


    # Controler qu'un fichier .bak est valide
    # pour cela on doit determiner qu'un fichier

    context "Bak File tests" {

        # On chercher un fichier bak avant tout

        $RandomServer = Get-Random -minimum 0 -Maximum $DatabaseServers.Count

        $ServerToTest = $DatabaseServers[$RandomServer]

        $BackupDatabaseList = Get-DbaBackupHistory -SqlInstance $ServerToTest -last


        $RandomDb = Get-Random -minimum 0 -Maximum $BackupDatabaseList.Count

        $BackupFileHeader = Read-DbaBackupHeader -SqlServer $ServerToTest -Path $BackupDatabaseList[$RandomDb].path
        
        it "$($BackupFileHeader.databasename) on $($ServerToTest) should have the Correct Flag (512)" {
            $BackupFileHeader.flags | Should Be  512 
        }
    }

    context "Database CPU Usage" {

        $SqlWriterCpuUsage = Get-DbaCpuUsage -SqlInstance Ganymede | Where-Object name -eq "sqlwriter/0"

        it "has a less then 10% Privileged User time" {
            $SqlWriterCpuUsage.PercentPrivilegedTime | Should BeLessOrEqual 10
        }

        it "has less then 10% Processor Time" {
            $SqlWriterCpuUsage.PercentProcessorTime | Should BeLessOrEqual 10

        }

    }

    context "Database Collation" {

        $DataBaseCollation = Test-DbaDatabaseCollation -SqlServer ganymede

        foreach($DataBase in $DataBaseCollation) {

            It "$($DataBase.Database) on $($Database.SqlInstance) Collation Should be $($Database.ServerCollation)" {
                $DataBase.IsEqual | Should Be $true
            }

        }

    }


 

}