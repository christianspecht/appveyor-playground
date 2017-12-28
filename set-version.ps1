
# are we on AppVeyor?
$appveyor = $env:APPVEYOR

if ($appveyor){
    
    # set version number
    if ($env:APPVEYOR_REPO_TAG -eq $true)
    {
        # we are building a tag -> we are doing a release -> use the tag as version number
        $shortversion = $env:APPVEYOR_REPO_TAG_NAME
        $longversion = $shortversion + '.' + $env:APPVEYOR_REPO_COMMIT
    }
    else
    {
        # regular CI build, no release
        $shortversion = '0.0.0'
        $longversion = '0.0.0.CI-' + $env:APPVEYOR_BUILD_NUMBER
    }

    appveyor AddMessage $version

} else {

    # TODO
    $shortversion = '0.0.0'
    $longversion = '0.0.0.TODO'
}

$env:ScmBackupShortVersion=$shortversion
$env:ScmBackupLongVersion=$longversion

Write-Host 'ScmBackupShortVersion: ' $env:ScmBackupShortVersion
Write-Host 'ScmBackupLongVersion: ' $env:ScmBackupLongVersion
