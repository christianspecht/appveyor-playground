# rename reset-build-number-token.txt.sample to reset-build-number-token.txt and paste your token
$token = Get-Content .\reset-build-number-token.txt


# https://www.appveyor.com/docs/api/#powershell
# https://www.appveyor.com/docs/api/projects-builds/#update-project-build-number
$headers = @{
  "Authorization" = "Bearer $token"
  "Content-type" = "application/json"
}

$url = 'https://ci.appveyor.com/api/projects/ChristianSpecht/appveyor-playground/settings/build-number'

$body = '{ "nextBuildNumber": 99 }'



Invoke-RestMethod -Method Put -Uri $url -Headers $headers -Body $body -OutFile reset-build-number-result.txt
