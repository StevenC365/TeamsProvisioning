Param(

    [string]$teamname, #The name of the Team
    [string]$teamowner, #The email address of the owner of the Team
    [string]$teamalias #The bit of the teamname you want to be the URL

)

#Connect to Teams PowerShell
$cred = Get-AutomationPSCredential -Name "TeamsAdmin"
$teams = Connect-MicrosoftTeams -Credential $cred

#Create the Team
$newteam = New-Team -Alias $teamalias -DisplayName $teamname -Owner $teamowner -AccessType Private 

#Return to Flow the new teams GroupID by passing the object as JSON
write-output $newteam | convertto-json

#Hangup
Disconnect-MicrosoftTeams
