while ($true) {


function dirMon {
    $dirout = ls
    sleep 5
    $dirout2 = ls

    $compareDirResult = Compare-Object $dirout $dirout2

    if ($compareDirResult -eq $null) {
        #do nothing
    }  else {
        $dirChangeOut = "DIRECTORY CHANGE DETECTED. $compareDirResult"
        Invoke-RestMethod "https://slack.com/api/chat.postMessage?channel={slackChannelId}&text=>$dirChangeOut&pretty=1" -Body token=xoxpxxxxxxxxxxxxxxxxxxxxxxxxxx -Method POST
    }
}

function hashMon {
    $hashList = ls | Get-FileHash -Algorithm SHA256 | Select-Object -ExpandProperty hash
    sleep 5 
    $hashList2 = ls | Get-FileHash -Algorithm SHA256 | Select-Object -ExpandProperty hash

    $comapareHash = Compare-Object $hashList $hashList2

    if ($comapareHash -eq $null) {
        #do nothing
    } else {
        $hashChangeOut = "FILE CHANGE DETECTED. $compareHash"
        Invoke-RestMethod "https://slack.com/api/chat.postMessage?channel={slackChannelId}&text=>$hashChangeOut&pretty=1" -Body token=xoxpxxxxxxxxxxxxxxxxxxxxxxxxxx -Method POST
    }
}

dirmon
hashmon

}
