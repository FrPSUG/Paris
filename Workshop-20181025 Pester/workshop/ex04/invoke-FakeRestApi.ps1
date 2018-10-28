function invoke-FakeRestApi {

    [cmdletbinding()]
    Param (
        [parameter(Mandatory=$true)]
        [ValidateSet("instance","ScheduledEvents")]
        [string]
        $MetaDataService,

        [parameter(Mandatory=$false)]
        [string]
        $MetaDataServiceUrl="http://169.254.169.254/metadata/",

        [parameter(Mandatory=$false)]
        [ValidateSet("2017-12-01","2017-04-02","2017-08-01","2017-08-01","2017-03-01")]
        [string]
        $MetaDataServiceApiVersion="2017-12-01",

        [parameter(Mandatory=$true)]
        [ValidateSet("Get","Post")]
        [string]
        $HttpMethod,

        [parameter(Mandatory=$false)]
        [hashtable]
        $HttpBody
    )

    $MetaDataHeaders = @{"Metadata"="true"}

    $MetaDataUri = $MetaDataServiceUrl + $MetaDataService + "/?api-version=" + $MetaDataServiceApiVersion

    $MetaDataRestApiParam = @{
        Method = $HttpMethod
        Headers = $MetaDataHeaders
        uri = $MetaDataUri
    }

    
    try {

        if ($PSBoundParameters.ContainsKey('HttpBody') -and $HttpMethod -eq "Post" -and $MetaDataService -eq "ScheduledEvents"){

            $HttpBody = $HttpBody | ConvertTo-Json

            
            $MetaDataRestApiParam.add("Body",$HttpBody)
            $MetaDataRestApiParam.add("ContentType","application/json")
    
        } 
        
            
        $MetaDataServiceResult = Invoke-RestMethod @MetaDataRestApiParam
       
       

        return  $MetaDataServiceResult

    }
    Catch [System.Net.WebException] {

        switch ($_.Exception.Response.StatusCode) {
            "BadRequest" { 
                throw "Missing Header"
             }
            "NotFound" { 
                throw "No element found"
             }
            "MethodNotAllowed" { 
                throw "Post and Get only"
             }
            
            "InternalServerError" { 
                throw "MetaData service Error"
            }
            Default {
                throw "MetaData service Error"  +  $_.Exception
            }
        }
    }
    catch {
        write-debug $_.Exception
        throw "Receive a general error " +  $_.Exception
    }



}