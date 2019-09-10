$lines = Get-Content ..\secrets\secrets.env
foreach ($line in $lines) {
    $a,$b = $line.split('=')
    Set-Variable $a $b
}

# execute remote commands
plink -l ${ipinterative_user} -pw ${ipinteractive_ssh_passphrase} -i ..\secrets\ipinteractive.ppk ${ipinterative_ip} "cd /data/git_ws/my-home && git pull"
plink -l ${ipinterative_user} -pw ${ipinteractive_ssh_passphrase} -i ..\secrets\ipinteractive.ppk ${ipinterative_ip} "cd /data/git_ws/my-home && ./build_and_run.sh"