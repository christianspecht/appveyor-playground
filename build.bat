dotnet restore
dotnet test "%~dp0\AppVeyorPlayground\AppVeyorPlayground.csproj" -c Release

appveyor AddMessage "test message"
