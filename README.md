# Shortest Trip To Earth Project Template

A Shortest Trip To Earth `dotnet new` style template to create a new mod.  
This creates a Shortest Trip To Earth Mod project which already includes BepInEx, Publicizer, game references, and some basic scaffolding.

# Template Note

When compiled in release mode, <project name>.zip will be created.  This zi p contains the mod's install files.

The workshop upload (CreateWorkshop.ps1) is a placeholder only as Shortest Trip To Earth does not support BepInEx/Harmony mods.  The purpose of the placeholder is to let users know that the install can be found on GitHub or NexusMods.com.

# Requirements
## Requires PowerShell Core
This template uses PowerShell Core to set the absolute paths in the workshop.vdf file.  The .vdf file spec does not support relative paths.

The install can be found here:
https://github.com/PowerShell/PowerShell/releases

Alternatively, if winget is installed, use this command:
 ```winget install --id Microsoft.PowerShell --source winget```

## Requires SteamCmd
SteamCmd is used to upload the mod to the workshop.

The .exe can be found here:
https://developer.valvesoftware.com/wiki/SteamCMD#Downloading_SteamCMD

Either copy the steamcmd.exe to the project's root directory, or put it in the system's path.

# Installation

The template can either be installed via a NuGet package or by installing from the source code.
Only one install method is needed.

## Install Via NuGet Package

This registers the dotnet template via the `NBK_RedSpy.ST_Template.Template.<version>.nupkg` in the releases folder.

Go to the releases page and download the latest *.nupkg file.
Open a command prompt in the directory that the nupkg was downloaded to.
type `dotnet new install <downloaded file name>` and press enter.

Example:
`dotnet new install .\NBK_RedSpy.ST_Template.Template.1.0.0.nupkg`

## Install Via Source Code
Download the source code from this repository.

Change to the ```template``` directory.
run `dotnet new install ./` in that directory.

The template is now installed.

# Template Usage

After the template is installed (as per the [Installation](#installation) section), a new project can be created with Visual Studio or the `dotnet` CLI tool.
The layout of the project is described in the [Folder Structure](#folder-structure) section.

## Visual Studio 
Visual Studio is the easier of the two methods.

For Visual Studio, create a new project via the main page UI.  There will be a Shortest Trip To Earth template available in the project type.  
A parameter screen will ask for the UserName, which is the name that will be used for the GitHub link (optional), mod's manifest, and the Harmony unique identifier prefix.

## dotnet Command line
Open a console window to the desired root directory (Ex: c:/src)

type `dotnet new ST_Template -o <some project name> --UserName <some user name>` where `<some project name>` is the name of the project, and `<some user name>` is the username to use as a username identifier.

Example: `dotnet new ST_Template -o ST_AmazingMod --UserName NBKRedSpy`

In the example above, there will now be a ST_AmazingMod folder in the current directory with the new project's files.  

*Important*: If the -o parameter is not provided, the files will be put into the current directory (instead of a sub directory) and the project name will be "template".

# Uninstall
At a command prompt, type 
`dotnet new uninstall ST_Template`

The output will indicate the uninstall command for the template.
Example:
```
The template 'ST_Template' is included to the packages:
   NBK_RedSpy.ST_Template.Template::1.0.0 (contains 1 templates)
To uninstall the template package use:
   dotnet new uninstall NBK_RedSpy.ST_Template.Template
```

In the example above, type `dotnet new uninstall NBK_RedSpy.ST_Template.Template` and press enter.

# Folder Structure

```
<Project Name>
│   .gitignore
│   CreateWorkshop.ps1
│   LICENSE.md
│   PostTemplateCreate.ps1
│   README.md
│   
├───media
│       thumbnail.png   -- Image used for the Readme and the Steam Workshop image.
├───package
├───src
│   │   .gitattributes
│   │   .gitignore
│   │   Example_Patch.cs  --An Example Harmony Path
│   │   Plugin.cs
│   │   <Project Name>.csproj
│   │   <Project Name>.sln
│   │   
│   └───Properties
│           AssemblyInfo.cs
│           
└───Workshop
        workshop.vdf    --The steam workshop file
```

To use the project:
* Make the changes to the files in the src folder.
* Overwrite the thumbnail.png to the media folder.
* Edit the README.md in the root:
    * Remove my Kofi link.
    * Edit as desired.
* Compile the project in Release Mode
    * This will create a <project name>.zip file in the root which can be uploaded to Nexus Mods.

# Uploading/Updating Steam Workshop Mod

To upload or update the placeholder mod entry to Steam Workshop, run the CreateWorkshop.ps1 script in PowerShell.

The script will prompt for the username, password, and steam guard code.  It processes and uploads the `workshop/workshop.vdf` file.
When the mod is first uploaded, the Steam Workshop Id will be added to the `workshop.vdf` file.

When done, update the title and description on the mod's Steam Workshop page.

## Steam and NexusMods Description Tools.
The following tools can convert the project's README.md to Steam and NexusMod's BBCode formats.

https://github.com/NBKRedSpy/MarkdownToSteam
https://github.com/NBKRedSpy/MarkdownToNexusMods

