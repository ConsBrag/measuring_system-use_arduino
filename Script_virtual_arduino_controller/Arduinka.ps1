
For ($i = 1; $i -le 1000; $i+=1) { 
$port= new-Object System.IO.Ports.SerialPort COM2,9600,None,8,one
$port.open()
$port.WriteLine(“ ”)
$date = Get-Date
$port.WriteLine($date)

$a = Get-Random —Maximum 28.5 -Minimum 27.5
$b = Get-Random —Maximum 1008.5 -Minimum 1007.5
$c = Get-Random —Maximum 42.5 -Minimum 41.5
$d = Get-Random —Maximum 58.5 -Minimum 57.5

$port.WriteLine(“Temperature = $a *C”)
$port.WriteLine(“Pressure = $b hPa”)
$port.WriteLine(“Approx.Altitude = $c m”)
$port.WriteLine(“Humidity = $d %”)
$port.Close()
Start-Sleep -s 1
}