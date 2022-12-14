$file = New-Object System.IO.StreamWriter("C:\logserver\logtest.log", $false, [System.Text.Encoding]::GetEncoding("unicode"))

while($true) `
{
  if($Udp.Available) `
  {
    $Buffer = $Udp.Receive([ref]$Sender)
    $MessageString = [Text.Encoding]::UTF8.GetString($Buffer)
    $file.WriteLine("$MessageString")
  }
}