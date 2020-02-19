param(
    $adname
    ,$email
    ,$name
    ,$title
    ,$pw
    ,$oldpw
    ,$option
)

if($oldpw)
{ $oldpassword = ConvertTo-SecureString -AsPlainText $oldpw -Force }

if($pw)
{ $newpassword = ConvertTo-SecureString -AsPlainText $pw -Force }

if($option -eq "unlock")
{
    # For unlocking an account in AD
    try { Unlock-ADAccount -Identity $adname }
    catch 
    {
        Write-Host "Commands not found"
        Exit 1
    }
}
elseif($option -eq "new")
{
    #---- New Active Directory account ----
    try
    {
        New-ADUser $adname -name "$name" -title "$title" -EmailAddress "$email"
        Enable-ADAccount -Identity $adname
    }
    Catch
    {
        Write-Host "Commands not found"
        Exit 1  
    }
}
elseif($option -eq "reset")
{
    if($oldpassword)
    {
        # ---- Change password ----
        try { Set-ADAccountPassword -Identity $adname -OldPassword (ConvertTo-SecureString -AsPlainText $oldpassword -Force) -NewPassword (ConvertTo-SecureString -AsPlainText $newpassword -Force) }
        catch 
        {
            Write-Host "Commands not found"
            Exit 1 
        }
    }
    else
    {
        try 
        {
            #---- In case user does not remember old password ----
            Set-ADAccountPassword -Identity $adname -NewPassword (ConvertTo-SecureString -AsPlainText $newpassword -Force)    
        }
        catch 
        {
            Write-Host "Commands not found"
            Exit 1 
        }
    }
}
elseif($option -eq "user query")
{
    try{ Get-ADUser -filter * | Where-Object{ $_.Name -like "*demo*" } }
    catch 
    {
        Write-Host "Commands not found"
        Exit 1 
    }
}
elseif($option -eq "computer query")
{
    try { Get-ADComputer -filter * }
    catch 
    {
        Write-Host "Commands not found"
        Exit 1 
    }
}
else
{
    Write-Host "No option specified!"
    Exit 400
}
