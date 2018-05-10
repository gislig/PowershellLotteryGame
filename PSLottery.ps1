#------------------
# Lottery game by Gisli Gudmundsson
# Created 13.11.2016

$ApplicationName = "PowerBalls"
$MaximumBallNumber = 20
$TotalGamePlays = 1000000
$RowWinningPercentage = 16.6667
$WinningRow = 0
$YourNumbers = "10","3","9","7","8","5"

function playLottery(){
    $BallRows = Get-Random -Count 6 -InputObject (01..$MaximumBallNumber)

    Write-Host "PowerBall Numbers :`t $BallRows" -ForegroundColor Cyan
    $Row0 = $false
    $Row1 = $false
    $Row2 = $false
    $Row3 = $false
    $Row4 = $false
    $Row5 = $false

    foreach($BallRow in $BallRows){
    for($i = 0; $i -lt $YourNumbers.Count;$i++){
            if($YourNumbers[$i] -eq $BallRow){
                $Number = $YourNumbers[$i]
                if($i -eq 0){ $Row0 = $true; $WinningRow = $WinningRow + $RowWinningPercentage }
                if($i -eq 1){ $Row1 = $true; $WinningRow = $WinningRow + $RowWinningPercentage }
                if($i -eq 2){ $Row2 = $true; $WinningRow = $WinningRow + $RowWinningPercentage }
                if($i -eq 3){ $Row3 = $true; $WinningRow = $WinningRow + $RowWinningPercentage }
                if($i -eq 4){ $Row4 = $true; $WinningRow = $WinningRow + $RowWinningPercentage }
                if($i -eq 5){ $Row5 = $true; $WinningRow = $WinningRow + $RowWinningPercentage }
            }
        }
    }
    if($Row0 -eq $true){ Write-Host "You got" $YourNumbers[0] "Correct" -ForegroundColor Green }
    if($Row1 -eq $true){ Write-Host "You got" $YourNumbers[1] "Correct" -ForegroundColor Green }
    if($Row2 -eq $true){ Write-Host "You got" $YourNumbers[2] "Correct" -ForegroundColor Green }
    if($Row3 -eq $true){ Write-Host "You got" $YourNumbers[3] "Correct" -ForegroundColor Green }
    if($Row4 -eq $true){ Write-Host "You got" $YourNumbers[4] "Correct" -ForegroundColor Green }
    if($Row5 -eq $true){ Write-Host "You got" $YourNumbers[5] "Correct" -ForegroundColor Green }
    if($WinningRow -gt 99){
        Write-Host "Congratulations you are a winner!! - Thank you for playin $ApplicationName" -ForegroundColor Red
        Write-Host "It took $NumberofGames times to win"
        Write-Host "----------------------------------------" -ForegroundColor Yellow
        Write-Host "PowerBall Numbers :`t $BallRows" -ForegroundColor Yellow
        Write-Host "Your Numbers :`t $YourNumbers" -ForegroundColor Yellow
        break
        
        
    }
    
}

Write-Host "Your Numbers : $YourNumbers" -ForegroundColor Yellow
for($p = 0; $p -lt $TotalGamePlays;$p++){
    $NumberofGames++;

    playLottery
}
Write-Host "It took $NumberofGames times to win" -ForegroundColor Yellow