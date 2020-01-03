Import-Module SMLets
$form = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        Title="Projection Builder" MaxHeight="615" MaxWidth="739" Height="614.6">
    <Grid>
        <TabControl HorizontalAlignment="Left" Height="575"  Margin="0,10,0,-0.2" VerticalAlignment="Top" Width="724" Background="#FFE5E5E5">
            <TabItem Header="Type Projection">
                <Grid Background="#FFE5E5E5" Name="grdddd">
                    <TextBox Name="txtProjectionName" HorizontalAlignment="Left" Height="23" Margin="163,12,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="181"/>
                    <TextBox Name="txtMPName" HorizontalAlignment="Left" Height="23" Margin="163,86,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="181"/>
                    <TextBox Name="txtSavePath" HorizontalAlignment="Left" Height="23" Margin="413,12,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="213" IsEnabled="False"/>
                    <TextBox Name="txtKeyPath" HorizontalAlignment="Left" Height="23" Margin="413,48,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="213" IsEnabled="False"/>
                    <TextBox Name="txtClass" HorizontalAlignment="Left" Height="23" Margin="57,171,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="192" IsEnabled="False"/>
                    <Label Content="Projection Name:" HorizontalAlignment="Left" Margin="12,12,0,0" VerticalAlignment="Top"/>
                    <Label Content="Management Pack Name:" HorizontalAlignment="Left" Margin="12,84,0,0" VerticalAlignment="Top"/>
                    <Label Content="Save Path:" HorizontalAlignment="Left" Margin="344,12,0,0" VerticalAlignment="Top"/>
                    <Label Content="Key Path:" HorizontalAlignment="Left" Margin="344,48,0,0" VerticalAlignment="Top"/>
                    <Label Content="Class:" HorizontalAlignment="Left" Margin="12,171,0,0" VerticalAlignment="Top" />
                    <DataGrid Name="grdRels" HorizontalAlignment="Left" Height="165" Margin="113,208,0,0" VerticalAlignment="Top" Width="590"/>
                    <Label Content="Relationships:" HorizontalAlignment="Left" Margin="17,208,0,0" VerticalAlignment="Top"/>
                    <Button Name="btnRelsAdd" Content="Add" HorizontalAlignment="Left" Margin="25,354,0,0" VerticalAlignment="Top" Width="75"/>
                    <Button Name="btnRelsRemove" Content="Remove" HorizontalAlignment="Left" Margin="25,467,0,0" VerticalAlignment="Top" Width="75"/>
                    <CheckBox Name="chkSeal" Content="Seal" HorizontalAlignment="Left" Margin="527,426,0,0" VerticalAlignment="Top"/>
                    <CheckBox Name="chkImport" Content="Import" HorizontalAlignment="Left" Margin="527,452,0,0" VerticalAlignment="Top"/>
                    <Button Name="btnBuild" Content="Build" HorizontalAlignment="Left" Margin="611,427,0,0" VerticalAlignment="Top" Width="92" Height="41" IsEnabled="False"/>
                    <Button Name="btnSaveBrowse" Content="Browse" HorizontalAlignment="Left" Margin="634,17,0,0" VerticalAlignment="Top" Width="75"/>
                    <Button Name="btnKeyBrowse" Content="Browse" HorizontalAlignment="Left" Margin="634,52,0,0" VerticalAlignment="Top" Width="75" IsEnabled="False"/>
                    <Button Name="btnClassBrowse" Content="Browse" HorizontalAlignment="Left" Margin="254,174,0,0" VerticalAlignment="Top" Width="75"/>
                    <TextBox Name="txtCompany" HorizontalAlignment="Left" Height="23" Margin="413,84,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="213" IsEnabled="False"/>
                    <Label Content="Company:" HorizontalAlignment="Left" Margin="344,84,0,0" VerticalAlignment="Top"/>
                    <TextBox Name="txtComputer" HorizontalAlignment="Left" Height="23" Margin="413,122,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="213" IsEnabled="False"/>
                    <Label Name="lblComputer" Content="Computer:" HorizontalAlignment="Left" Margin="344,122,0,0" VerticalAlignment="Top" Visibility="Visible"/>
                    <Label Content="Selected:" HorizontalAlignment="Left" Margin="42,386,0,0" VerticalAlignment="Top"/>
                    <TextBox Name="txtProjDisplay" HorizontalAlignment="Left" Height="23" Margin="163,50,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="181"/>
                    <Label Content="Projection DisplayName:" HorizontalAlignment="Left" Margin="12,50,0,0" VerticalAlignment="Top"/>
                    <TextBox ToolTip="Version should be in the form 7.0.5.0" Name="txtMPVersion" HorizontalAlignment="Left" Height="23" Margin="163,122,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="181"/>
                    <Label Content="Management Pack Version:" HorizontalAlignment="Left" Margin="12,122,0,0" VerticalAlignment="Top"/>
                    <DataGrid Name="grdSelectedRels" HorizontalAlignment="Left" Height="100" Margin="113,386,0,0" VerticalAlignment="Top" Width="409" CanUserAddRows="False"/>
                    <Label Content="Filter:" HorizontalAlignment="Left" Margin="371,171,0,0" VerticalAlignment="Top"/>
                    <TextBox Name="txtRelFilter" HorizontalAlignment="Left" Height="23" Margin="414,171,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="120"/>
                </Grid>
            </TabItem>

        </TabControl>
    </Grid>
</Window>
"@

$classForm = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        Title="Select a Class" Height="353.17" Width="376.631">
    <Grid Background="#FFE5E5E5">
        <ListBox Name="grdClass" HorizontalAlignment="Left" Height="205" Margin="10,53,0,0" VerticalAlignment="Top" Width="342"/>
        <Button Name="btnClassSelect" Content="Select" HorizontalAlignment="Left" Margin="129,273,0,0" VerticalAlignment="Top" Width="110" Height="25"/>
        <TextBox Name="txtClassFilter" HorizontalAlignment="Left" Height="23" Margin="53,26,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="120"/>
        <Label Content="Filter:" HorizontalAlignment="Left" Margin="10,22,0,0" VerticalAlignment="Top"/>

    </Grid>
</Window>
"@

$relForm = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        Title="Relationship" MaxHeight="615" MaxWidth="739" Height="231.133" Width="523.2" Background="#FFE5E5E5" >
    <Grid>
        <TextBox Name="txtRelName" HorizontalAlignment="Left" Height="23" Margin="136,35,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="267" IsEnabled="False" />
        <Label Content="Relationship Name:" HorizontalAlignment="Left" Margin="17,32,0,0" VerticalAlignment="Top" Width="114"/>
        <TextBox Name="txtRelAlias" HorizontalAlignment="Left" Height="23" Margin="136,66,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="267"/>
        <Label Content="Relationship Alias:" HorizontalAlignment="Left" Margin="17,63,0,0" VerticalAlignment="Top" Width="114"/>
        <CheckBox Name="chkRelTarget" Content="Target" HorizontalAlignment="Left" Margin="418,43,0,0" VerticalAlignment="Top"/>
        <Button Name="btnAddRelationshipC" Content="Add" HorizontalAlignment="Left" Margin="206,122,0,0" VerticalAlignment="Top" Width="110" Height="43"/>

    </Grid>
</Window>
"@

$rcForm = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        Title="Remote Computer" Width="454.2" Height="251.4">
    <Grid Background="#FFE5E5E5">
        <Button Name="btnRCYes" Content="Yes" HorizontalAlignment="Left" Margin="36,148,0,0" VerticalAlignment="Top" Width="134" Height="44"/>
        <TextBox Name="txtRemoteComputer" HorizontalAlignment="Left" Height="23" Margin="151,83,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="170"/>
        <Label Content="Remote Computer:" HorizontalAlignment="Left" Margin="36,79,0,0" VerticalAlignment="Top"/>
        <Label Content="Would you like to specify a remote computer for SMLets commands?" HorizontalAlignment="Left" Margin="36,42,0,0" VerticalAlignment="Top"/>
        <Button Name="btnRCNo" Content="No" HorizontalAlignment="Left" Margin="276,148,0,0" VerticalAlignment="Top" Width="134" Height="44"/>

    </Grid>
</Window>
"@


#region Function defintions
Function Load-Dialog {
    Param(
        [Parameter(Mandatory=$True,Position=1)]
        [string]$XamlPath
    )
    [xml]$xmlWPF = $XamlPath
    try{
        Add-Type -AssemblyName PresentationCore,PresentationFramework,WindowsBase,system.windows.forms
    } 
    catch {
        Throw "Failed to load Windows Presentation Framework assemblies."
    }
    $xamGUI = [Windows.Markup.XamlReader]::Load((new-object System.Xml.XmlNodeReader $xmlWPF))
    $xmlWPF.SelectNodes("//*[@Name]") | %{
        Set-Variable -Name ($_.Name) -Value $xamGUI.FindName($_.Name) -Scope Global
    }
    return $xamGUI
}

Function New-SCSMTypeProjection {
    [cmdletbinding(
        DefaultParameterSetName='Other'
    )]
    param(
    [parameter(mandatory=$true)][String]$Name,
    [parameter(mandatory=$false)][String]$MPName,
    [parameter(mandatory=$false)][string]$MPVersion,
    [parameter(mandatory=$false)][string]$DisplayName,
    [parameter(mandatory=$true)][Microsoft.EnterpriseManagement.Configuration.ManagementPackType]$Type = $(throw "Specify a valid SCSM Class"),
    [parameter(mandatory=$true)][ValidateScript({
        if (($_.gettype().Name) -ne 'ManagementPackRelationship'  ) {Throw "$($_) is not a relationship class"} else {$true}
        })][System.Array]$Relationships,
    [parameter(mandatory=$true)][String]$savePath,
    [Parameter(ParameterSetName='Seal',Mandatory=$false)][Parameter(ParameterSetName='Both',Mandatory=$false)][switch]$Seal,
    [Parameter(ParameterSetName='Seal',Mandatory=$true)][Parameter(ParameterSetName='Both',Mandatory=$true)][string]$KeyPath,
    [Parameter(ParameterSetName='Seal',Mandatory=$true)][Parameter(ParameterSetName='Both',Mandatory=$true)][string]$CompanyName,
    [Parameter(ParameterSetName='Import',Mandatory=$false)][Parameter(ParameterSetName='Both',Mandatory=$false)][switch]$Import,
    [Parameter(ParameterSetName='Import',Mandatory=$true)][Parameter(ParameterSetName='Both',Mandatory=$true)][string]$ComputerName
    )

    If (!($DisplayName)) {
        $DisplayName = $Name
    }

    If (!($MPName)) {
        $MPName = $Name.replace(" ", ".") + "_MP"
    }

    If (!($MPVersion)) {
        $MPVersion = "1.0.0.0"
    }

    $ReferencesToInclude = New-Object System.Collections.ArrayList

    $TypeMP = $type.GetManagementPack()
    $ReferencesToInclude.add($TypeMP)

    foreach ($relationship in $Relationships) {
        
        $relMP = $relationship.GetManagementPack()
        if (!($ReferencesToInclude.Contains($relMP))) {
            $ReferencesToInclude.add($relMP)
        }
    }

    [xml]$doc = New-Object System.Xml.XmlDocument
    $dec = $Doc.CreateXmlDeclaration("1.0","UTF-8",$null)
    $doc.AppendChild($dec)
    $ManagementPack = $doc.CreateNode("element","ManagementPack",$null)
    $ManagementPack.SetAttribute("ContentReadable", "true")
    $ManagementPack.SetAttribute("SchemaVersion", "2.0")
    $ManagementPack.SetAttribute("OriginalSchemaVersion", "1.1")
    $ManagementPack.SetAttribute("xmlns:xsd", "http://www.w3.org/2001/XMLSchema")
    $ManagementPack.SetAttribute("xmlns:xsl", "http://www.w3.org/1999/XSL/Transform")

        $Manifest = $doc.CreateNode("element","Manifest",$null)
            $Identity = $doc.CreateNode("element", "Identity", $null)
                $identityName = $doc.CreateElement("ID")
                $identityName.InnerText = $mpName
                $identityVersion = $doc.CreateElement("Version")
                $identityVersion.InnerText = $mpVersion
            $Identity.AppendChild($identityName)
            $Identity.AppendChild($identityVersion)
            $xmlMPName = $doc.CreateElement("Name")
            $xmlMPName.InnerText = $mpName

            $Refrences = $doc.CreateNode("element", "References", $null)

                foreach ($r in $ReferencesToInclude) {
                    $Reference = $doc.CreateNode("element", "Reference", $null)
                    $Reference.SetAttribute("Alias", $r.name.replace(".","_"))
                    $referenceId = $doc.CreateElement("ID")
                    $referenceId.InnerText = $r.name
                    $Reference.AppendChild($referenceId)
                    $referenceVersion = $doc.CreateElement("Version")
                    $referenceVersion.InnerText = $r.version.ToString()
                    $Reference.AppendChild($referenceVersion)
                    $referenceToken = $doc.CreateElement("PublicKeyToken")
                    $referenceToken.InnerText = $r.KeyToken
                    $Reference.AppendChild($referenceToken)
                    $Refrences.AppendChild($Reference)
                }

        $Manifest.AppendChild($Identity)
        $Manifest.AppendChild($xmlMPName)
        $Manifest.AppendChild($Refrences)

        #
        $TypeDefinitions = $doc.CreateNode("element", "TypeDefinitions", $null)
            $EntityTypes = $doc.CreateNode("element", "EntityTypes", $null)
                $TypeProjections = $doc.CreateNode("element", "TypeProjections", $null)
                    $TypeProjection = $doc.CreateNode("element", "TypeProjection", $null)
                    $TypeProjection.setAttribute("ID", $Name)
                    $TypeProjection.setAttribute("Accessibility", "Public")
                    $TypeProjection.setAttribute("Type", $TypeMP.Name.Replace('.','_') + "!" + $Type.Name)
                    foreach ($relationship in $Relationships) {

                        $Component = $doc.CreateElement("Component")
                        if (($Type.getbasetypes() -notcontains $Relationship.Source.Class) -and  ($type -ne $relationship.source.class)){
                            $Component.SetAttribute("Path", "`$Context/Path[Relationship='" + ($relationship.GetManagementPack().Name.replace('.','_')) + "!" + $relationship.Name + "' SeedRole='Target']`$")  
                        }
                        else {
                         $Component.SetAttribute("Path", "`$Context/Path[Relationship='" + ($relationship.GetManagementPack().Name.replace('.','_')) + "!" + $relationship.Name + "']`$")
                        }
                        $component.SetAttribute("Alias", $relationship.name.split('.')[$relationship.name.split('.').Length -1])
                        $TypeProjection.AppendChild($Component)
                    }
                $TypeProjections.AppendChild($TypeProjection)
            $EntityTypes.AppendChild($TypeProjections)
        $TypeDefinitions.AppendChild($EntityTypes)
        #
        $LanguagePacks = $doc.CreateNode("element", "LanguagePacks", $null) 
            $LanguagePack = $doc.CreateNode("element", "LanguagePack", $null)
            $LanguagePack.SetAttribute("ID", "ENU")
            $LanguagePack.SetAttribute("IsDefault", "false")

                ## Create a DisplayString for the MP itself
                $DisplayStrings = $doc.CreateNode("element", "DisplayStrings", $null)
                    $displayString = $doc.CreateElement("DisplayString")
                    $displayString.SetAttribute("ElementID", $mpName)
                        $displayStringName = $doc.CreateElement("Name")
                        $displayStringName.InnerText = $mpName
                    $displayString.AppendChild($displayStringName)
                $DisplayStrings.AppendChild($displayString)

                ## create a displaystring for the Projection name
                    $displayString = $doc.CreateElement("DisplayString")
                    $displayString.SetAttribute("ElementID", $Name)
                        $displayStringName = $doc.CreateElement("Name")
                        $displayStringName.InnerText = $DisplayName
                    $displayString.AppendChild($displayStringName)
                $DisplayStrings.AppendChild($displayString)
            $LanguagePack.AppendChild($DisplayStrings)
        $LanguagePacks.AppendChild($LanguagePack)

    $ManagementPack.AppendChild($Manifest)
    $ManagementPack.AppendChild($TypeDefinitions)
    $ManagementPack.AppendChild($LanguagePacks)

    $doc.AppendChild($ManagementPack)
    $doc.Save($savePath + "\" + $mpName + ".xml")
    if ($Seal) {
        #thanks John Doyle
        Protect-SCManagementPack -ManagementPackFile ($savePath + "\" + $MPName + ".xml") -OutputDirectory $savePath -KeyFilePath $keypath -CompanyName $CompanyName
        Remove-Item ($savePath + "\" + $MPName + ".xml")
    }
    if ($Import) {
        if ($Seal) {
            Import-SCSMManagementPack -Fullname ($savePath + "\" + $MPName + ".mp") -ComputerName $computerName
        }
        else {
            Import-SCSMManagementPack -Fullname ($savePath + "\" + $MPName + ".xml") -ComputerName $computerName
        }
    }

}

Function Get-ClassRelationships {
    param([parameter(mandatory=$true)]$class) 
    $relationships = New-Object System.Collections.ArrayList
    $relationships.AddRange($class.GetRelationships())
    $baseTypes = $class.GetBaseTypes()
    foreach ($bt in $baseTypes) {
        if ($bt.Name -ne 'System.Entity') {
            $relationships.AddRange($bt.GetRelationships())
        }
    }
    $relationships = $relationships | ?{$_.displayname -ne $null} | select displayname, source,target,name

    return $relationships
}

Function Get-TargetClasses {
    param($control)
    $classWin = Load-Dialog $classForm
    if ($remoteComputer) {
        $Classes = Get-SCSMClass -ComputerName $remoteComputer | ?{($_.GetBaseTypes().Name -contains "System.WorkItem") -or ($_.GetBaseTypes().Name -contains "System.ConfigItem") -and (!($_.extension))} |sort Name
    }
    else {
        $Classes = Get-SCSMClass | ?{($_.GetBaseTypes().Name -contains "System.WorkItem") -or ($_.GetBaseTypes().Name -contains "System.ConfigItem") -and (!($_.extension))} |sort Name
    }
    $grdClassSource = New-Object System.Collections.ArrayList
    foreach ($class in $classes) {
        $grdClassSource.Add(($class | select -ExpandProperty name))
    }
    $grdClass.ItemsSource = $grdClassSource

    $txtClassfilter.add_keyup({
        if ($txtClassfilter.text -ne "") {
            $grdSource = $grdClassSource | ?{$_ -like ("*" + $txtClassfilter.text + "*")}
            if ($grdSource.Count -gt 1) {
                $grdClass.ItemsSource = $grdSource
            }
            else {
                $uniSource = @($grdSource)
                $grdClass.ItemsSource = $uniSource
                
            }
        }
   })
    $btnClassSelect.add_click({
        $txtClass.Text = $grdClass.SelectedItem
        
        ### relationship stuff
        if ($remoteComputer) {
            $class = Get-SCSMClass -Name $grdClass.SelectedItem -ComputerName $remoteComputer
        }
        else {
            $class = Get-SCSMClass -Name $grdClass.SelectedItem
        }
        $mp = $class.GetManagementPack()
        $relationships = New-Object System.Collections.ArrayList
        $classRels = $class.GetRelationships()
        if ($classRels.count -lt 2) {
            $relationships.AddRange(@($classRels))
        }
        else {
            $relationships.AddRange($classRels)
        }
        $baseTypes = $class.GetBaseTypes()
        foreach ($bt in $baseTypes) {
            if ($bt.Name -ne 'System.Entity') {
                $relationships.AddRange($bt.GetRelationships())
            }
        }
        $relationships = $relationships | ?{$_.displayname -ne $null} | select displayname, source,target,name
        $grdRels.ItemsSource = $relationships
        ###



        $classWin.close()
    })
    $classWin.showdialog() | Out-Null
}

Function Get-Folder($initialDirectory)

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

Function Get-FileName($initialDirectory)
{   
 [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
 Out-Null

 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = $initialDirectory
 $OpenFileDialog.filter = "All files (*.*)| *.*"
 $OpenFileDialog.ShowDialog() | Out-Null
 $OpenFileDialog.filename
} 

Function Get-Validation {
    param(
    [parameter(mandatory=$false)][boolean]$ValidateSeal,
    [parameter(mandatory=$false)][boolean]$ValidateImport
    )
    if ($ValidateSeal) {
        if (($txtCompany.Text -ne '') -and ($txtKeyPath.Text -ne '')) {
            if (Test-Path $txtKeyPath.Text) {
                $retValue = $true
            }
            else {
                return $false
            }
        }
        else {
            return $false
        }
    }

    if ($ValidateImport) {
        if ($txtComputer.text -ne '' -and (Test-Connection -ComputerName $txtComputer.text -Count 1 -ErrorAction SilentlyContinue)) {
            $retValue = $true
        }
        else {
            return $false
        }
    }

    if (($txtProjectionName.text -ne "") -and ($grdSelectedRels.items.count -gt 0) -and ($txtSavePath.Text -ne "")) {
        if (Test-Path $txtSavePath.text) {
            $retValue = $true
        } ##possibly return an error message here that the path isn't valid?
        else {$retValue = $false}
        
    }
    else {
        $retValue = $false
    }

    if ($txtMPVersion.Text -ne '' -and $retValue) {
        $retValue = Check-Version
    }
    
    return $retValue
    
}


Function Check-Version {
    [system.version]$b = $null
    if ( [System.Version]::TryParse($txtMPVersion.Text, [ref]$b)) {
        if (($b.Minor -ge 0) -and ($b.Build -ge 0) -and ($b.Revision -ge 0)) {
            return $true
        }
        else {
            return $false
        }
    }
    else {
        return $false
    }
}

#endregion

$win = Load-Dialog $Form

$chkImport.add_click({
    $txtComputer.IsEnabled = $chkImport.IsChecked
    $btnBuild.IsEnabled = Get-Validation -ValidateSeal $chkSeal.IsChecked -ValidateImport $chkImport.IsChecked
})

$btnSaveBrowse.add_click({
    $path = Get-Folder
    $txtSavePath.Text = $path.tostring()
    $btnBuild.IsEnabled = Get-Validation -ValidateSeal $chkSeal.IsChecked -ValidateImport $chkImport.IsChecked
})

$btnClassBrowse.add_click({
    Get-TargetClasses -control $txtClass
   $grdSelectedRels.ItemsSource = @()
})

$chkSeal.add_click({
    $txtCompany.IsEnabled = $chkSeal.IsChecked
    $txtKeyPath.IsEnabled = $chkSeal.IsChecked
    $btnKeyBrowse.IsEnabled = $chkSeal.IsChecked
    $btnBuild.IsEnabled = Get-Validation -ValidateSeal $chkSeal.IsChecked -ValidateImport $chkImport.IsChecked
   
})

$txtCompany.add_keyup({
    $btnBuild.IsEnabled = Get-Validation -ValidateSeal $chkSeal.IsChecked -ValidateImport $chkImport.IsChecked
})

$btnRelsAdd.add_click({
    $source = New-Object System.Collections.ArrayList
    if ($grdSelectedRels.ItemsSource) {
        $source.AddRange($grdSelectedRels.ItemsSource)  
    }
    if (!($source.Contains($grdRels.SelectedItem))) {
        $source.Add($grdRels.SelectedItem)
        $grdSelectedRels.ItemsSource = $source
        $btnBuild.IsEnabled = Get-Validation -ValidateSeal $chkSeal.IsChecked -ValidateImport $chkImport.IsChecked
    }
    else {
        [System.Windows.MessageBox]::show($grdRels.SelectedItem.DisplayName + " has already been selected")
    }
    
})

$btnRelsRemove.add_click({
    $gridItemsSource = New-Object System.Collections.ArrayList
    $gridItemsSource.AddRange($grdSelectedRels.ItemsSource)
    $gridItemsSource.Remove($grdSelectedRels.SelectedItem)
    $grdSelectedRels.ItemsSource = $gridItemsSource
    $btnBuild.IsEnabled = Get-Validation -ValidateSeal $chkSeal.IsChecked -ValidateImport $chkImport.IsChecked
})

$txtRelfilter.add_keyup({
    if ($txtRelfilter.text -ne "") {
        $grdSource = $grdRels.Items | ?{$_.DisplayName -like ("*" + $txtRelfilter.text + "*")}
        if ($grdSource.Count -gt 1) {
            $grdRels.ItemsSource = $grdSource
        }
        else {
            $uniSource = @($grdSource)
            $grdRels.ItemsSource = $uniSource
                
        }
    }
    else {
        $class = Get-SCSMClass -Name $txtClass.Text
        $grdRels.ItemsSource = Get-ClassRelationships -class $class
    }
})

$txtSavePath.add_TextChanged({
    $btnBuild.IsEnabled = Get-Validation -ValidateSeal $chkSeal.IsChecked -ValidateImport $chkImport.IsChecked
})

$txtProjectionName.add_TextChanged({
    $btnBuild.IsEnabled = Get-Validation -ValidateSeal $chkSeal.IsChecked -ValidateImport $chkImport.IsChecked
})

$txtComputer.add_LostFocus({
    $btnBuild.IsEnabled = Get-Validation -ValidateSeal $chkSeal.IsChecked -ValidateImport $chkImport.IsChecked
})

$btnKeyBrowse.add_click({
    $txtKeyPath.text = Get-FileName 
})

$txtMPVersion.add_textchanged({
    $btnBuild.IsEnabled = Get-Validation -ValidateSeal $chkSeal.IsChecked -ValidateImport $chkImport.IsChecked
})

$btnBuild.add_click({
    $selectedrelationships = @()
    if ($remoteComputer) {
        $grdSelectedRels.ItemsSource | % {if ($selectedrelationships -notcontains (Get-SCSMRelationshipClass -Name $_.name -ComputerName $remoteComputer)) {$selectedrelationships += Get-SCSMRelationshipClass -Name $_.name -ComputerName $remoteComputer} }
    }
    else {
        $grdSelectedRels.ItemsSource | % {if ($selectedrelationships -notcontains (Get-SCSMRelationshipClass -Name $_.name )) {$selectedrelationships += Get-SCSMRelationshipClass -Name $_.name } }
    }
    if ($chkSeal.IsChecked -and $chkImport.IsChecked) {
        if ($remoteComputer) {
            New-SCSMTypeProjection -Name $txtProjectionName.text -Type (Get-SCSMClass -Name ($txtClass.text + "$") -ComputerName $remoteComputer) -Relationships $selectedrelationships -savePath $txtSavePath.Text -DisplayName $txtProjDisplay.text -MPName $txtMPName.Text -MPVersion $txtMPVersion.Text -Seal -KeyPath $txtKeyPath.Text -Import -CompanyName $txtCompany.Text -ComputerName $txtComputer.Text
        }
        else {
            New-SCSMTypeProjection -Name $txtProjectionName.text -Type (Get-SCSMClass -Name ($txtClass.text + "$")) -Relationships $selectedrelationships -savePath $txtSavePath.Text -DisplayName $txtProjDisplay.text -MPName $txtMPName.Text -MPVersion $txtMPVersion.Text -Seal -KeyPath $txtKeyPath.Text -Import -CompanyName $txtCompany.Text -ComputerName $txtComputer.Text
        }
    }
    else {
        if ($chkSeal.IsChecked) {
            if ($remoteComputer) {
                New-SCSMTypeProjection -Name $txtProjectionName.text -Type (Get-SCSMClass -Name ($txtClass.text + "$") -ComputerName $remoteComputer) -Relationships $selectedrelationships -savePath $txtSavePath.Text -DisplayName $txtProjDisplay.text -MPName $txtMPName.Text -MPVersion $txtMPVersion.Text -Seal -KeyPath $txtKeyPath.Text -CompanyName $txtCompany.Text
            }
            else {
                New-SCSMTypeProjection -Name $txtProjectionName.text -Type (Get-SCSMClass -Name ($txtClass.text + "$")) -Relationships $selectedrelationships -savePath $txtSavePath.Text -DisplayName $txtProjDisplay.text -MPName $txtMPName.Text -MPVersion $txtMPVersion.Text -Seal -KeyPath $txtKeyPath.Text -CompanyName $txtCompany.Text
            }
        }
        elseif ($chkImport.IsChecked) {
            if ($remoteComputer) {
                New-SCSMTypeProjection -Name $txtProjectionName.text -Type (Get-SCSMClass -Name ($txtClass.text + "$") -ComputerName $remoteComputer) -Relationships $selectedrelationships -savePath $txtSavePath.Text -DisplayName $txtProjDisplay.text -MPName $txtMPName.Text -MPVersion $txtMPVersion.Text -Import -ComputerName $txtComputer.Text
            }
            else {
                New-SCSMTypeProjection -Name $txtProjectionName.text -Type (Get-SCSMClass -Name ($txtClass.text + "$")) -Relationships $selectedrelationships -savePath $txtSavePath.Text -DisplayName $txtProjDisplay.text -MPName $txtMPName.Text -MPVersion $txtMPVersion.Text -Import -ComputerName $txtComputer.Text
            }
        }
        else {
            if ($remoteComputer) {
                New-SCSMTypeProjection -Name $txtProjectionName.text -Type (Get-SCSMClass -Name ($txtClass.text + "$") -ComputerName $remoteComputer) -Relationships $selectedrelationships -savePath $txtSavePath.Text -DisplayName $txtProjDisplay.text -MPName $txtMPName.Text -MPVersion $txtMPVersion.Text
            }
            else {
                New-SCSMTypeProjection -Name $txtProjectionName.text -Type (Get-SCSMClass -Name ($txtClass.text + "$")) -Relationships $selectedrelationships -savePath $txtSavePath.Text -DisplayName $txtProjDisplay.text -MPName $txtMPName.Text -MPVersion $txtMPVersion.Text
            }
        }
    }
    [System.Windows.Forms.MessageBox]::show('Management Pack Complete!')
    $txtClass.text = ""
    $grdRels.ItemsSource = @()
    $grdSelectedRels.ItemsSource = @()
    $btnBuild.IsEnabled = Get-Validation -ValidateSeal $chkSeal.IsChecked -ValidateImport $chkImport.IsChecked
   
})

$remoteWin = Load-Dialog -XamlPath $rcForm

$btnRCYes.add_click({
    $remoteComputer = $txtRemoteComputer.Text
    $remoteWin.close()
    $win.ShowDialog()
})

$btnRCNo.add_click({
    $remoteWin.close()
    $win.ShowDialog()
})

$remoteWin.ShowDialog()
