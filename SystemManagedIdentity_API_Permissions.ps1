Install-Module Microsoft.Graph -Scope CurrentUser

Connect-MgGraph -Scopes Application.Read.All, AppRoleAssignment.ReadWrite.All, RoleManagement.ReadWrite.Directory

#Object ID of the managed identity
$managedIdentityId = ""
#Role to grant
$roleName = "User.ReadWrite.All"
#app id bi = 00000009-0000-0000-c000-000000000000
#app id graph = 00000003-0000-0000-c000-000000000000
$msgraph = Get-MgServicePrincipal -Filter "AppId eq '00000003-0000-0000-c000-000000000000'"
$role = $Msgraph.AppRoles| Where-Object {$_.Value -eq $roleName} 

New-MgServicePrincipalAppRoleAssignment -ServicePrincipalId $managedIdentityId -PrincipalId $managedIdentityId -ResourceId $msgraph.Id -AppRoleId $role.Id
 
Disconnect-MgGraph
