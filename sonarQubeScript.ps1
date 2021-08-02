#Install packages
dotnet add package coverlet.msbuild 

#DO tests and generate reports
dotnet test  /p:CollectCoverage=true /p:CoverletOutputFormat=opencover /p:CoverletOutput="./TestResults/"  
#Start Scan Observer
dotnet sonarscanner begin /k:"INT-039"  /d:sonar.login="51ae7a35136442f73ef6caa3e4acee22be2f2421" /d:sonar.cs.opencover.reportsPaths="**/TestResults/coverage.opencover.xml" /d:sonar.coverage.exclusions="**Tests*"
#Start Build Main Project (not test project) .csproj
dotnet build
#End Scan Observer -> Send to SonarQube Server
dotnet sonarscanner end  /d:sonar.login="51ae7a35136442f73ef6caa3e4acee22be2f2421"