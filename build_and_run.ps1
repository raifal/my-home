$lines = Get-Content ..\secrets\secrets.env
foreach ($line in $lines) {
    $a,$b = $line.split('=')
    Set-Variable $a $b
}

$env:postgres_password=$postgres_password

#docker-compose -f docker-compose.yml config

docker-compose down

docker network rm rf_network
docker network create rf_network

Push-Location .\my-home-backend
mvn clean install -DskipTests=true
Pop-Location

Push-Location .\my-home-web
ng build --prod
Pop-Location

docker-compose up -d
