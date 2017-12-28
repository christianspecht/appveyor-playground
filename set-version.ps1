
# are we on AppVeyor?
$appveyor = $env:APPVEYOR

if ($appveyor){
    
    # set version number
    if ($env:APPVEYOR_REPO_TAG)
    {
        # we are building a tag -> we are doing a release -> use the tag as version number
        $version = $env:APPVEYOR_REPO_TAG_NAME + '.' + $env:APPVEYOR_REPO_COMMIT
    }
    else
    {
        # regular CI build, no release
        $version = '0.0.0.CI-' + $env:APPVEYOR_BUILD_NUMBER
    }

    appveyor AddMessage $version

    $env:ScmBackupVersion=$version

} else {

    # TODO
}

Write-Host 'GithubApiTests_Name: ' $env:GithubApiTests_Name
Write-Host 'ScmBackupVersion: ' $env:ScmBackupVersion
