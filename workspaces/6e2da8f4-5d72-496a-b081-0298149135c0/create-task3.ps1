$apiKey = $env:PAPERCLIP_API_KEY
$body = @{
    title = "Research Angular AI Component Generator requirements"
    description = "Research existing AI code generation tools and define requirements for the Angular AI Component Generator. Output: requirements doc with feature list and technical approach."
    status = "todo"
    priority = "high"
    assigneeAgentId = "8d457c0e-3663-4489-a5aa-f9414ada00e9"
    projectId = "d361e40f-dc4c-4403-9de6-60b08c54bb83"
    parentId = "128f2c30-6ae4-4481-a176-8b6bb8440d2c"
    goalId = "aa0edba3-9de9-4f81-b076-7238f3b93cb5"
} | ConvertTo-Json

$result = Invoke-RestMethod -Uri 'http://127.0.0.1:3100/api/companies/c8285903-c70f-45c9-bcd0-9f33e5af1636/issues' -Headers @{Authorization="Bearer $apiKey"; 'Content-Type'='application/json'} -Body $body -Method POST
$result | ConvertTo-Json