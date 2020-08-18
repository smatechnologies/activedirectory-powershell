param(
    $smtp ="smtp.office365.com" # SMTP/Email server
    ,$to       # Destination email account
    ,$from     # Email user
    ,$user     # Email user
    ,$password # Email password (use Encrypted Global Property)
    ,$port = 587 # Port for sending email
    ,$selfserviceLink  # Example: https://<OpCon Server>:8443/#!selfservice/servicerequest/AD%20Unlock
)

try
{ 
    Get-Date | Out-Host
    $results = get-aduser -filter * -Properties * | where-object{ $_.enabled -eq $true -and $_.lockedout -eq $true} | Select-Object Name,Mail,Enabled,LockedOut,PasswordExpired
    $results | Out-Host 
    Write-host "Found"$results.Count"accounts that are locked out."

    if($results.Count -gt 0) 
    {
        $results | ForEach-Object{ $body = $body + "<br>Name: " + $_.Name + "<br>Mail: " + $_.Mail + "<br>Enabled: " + $_.Enabled + "<br>LockedOut: " + $_.LockedOut + "<br>PasswordExpired: " + $_.PasswordExpired + "<br>" }
        $body = $body + "<br>Self Service: <a href='" + $selfserviceLink + "'>Click here</a>"
        $subject = "AD locked accounts report " + (Get-Date -Format "MM/dd/yyyy hh:mm")
 
        $secpasswd = ConvertTo-SecureString "$password" -AsPlainText -Force
        $mycreds = New-Object System.Management.Automation.PSCredential ($user, $secpasswd)
        
        Send-MailMessage -SmtpServer $smtp -To $to -From $from -Subject $subject -Body $body -BodyAsHtml -UseSSL -Credential $mycreds -Port $port
    }
}
catch [Exception]
{
    Write-Host $_
    Write-Host "Error finding accounts or sending email!"
    Exit 1 
}
