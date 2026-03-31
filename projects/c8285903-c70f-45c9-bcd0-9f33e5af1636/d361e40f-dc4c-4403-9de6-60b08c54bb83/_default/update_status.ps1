$headers = @{
    'Authorization' = "Bearer $env:PAPERCLIP_API_KEY"
    'X-Paperclip-Run-Id' = "$env:PAPERCLIP_RUN_ID"
    'Content-Type' = 'application/json'
}
$body = @{
    status = "done"
    comment = "Drafted Day 2 LinkedIn post on Angular Signals deep dive. Content covers: what are signals, computed signals, effects, migration strategy. Ready for review."
} | ConvertTo-Json

$result = Invoke-RestMethod -Uri 'http://127.0.0.1:3100/api/issues/c8714942-311a-4430-8900-3c26b3cdb727' -Headers $headers -Method Patch -Body $body
$result | ConvertTo-Json -Depth 5
