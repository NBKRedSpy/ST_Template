<# 
.DESCRIPTION
    Changes the Workshop.vdf paths to absolute paths as per spec.
    Unfortunately, this will cause an issue for users with projects in different directories.
#>

$VdfPath = dir ./Workshop/workshop.vdf

# The VDF requires absolute paths. 
(Get-Content $VdfPath).Replace("`$ProjectDir`$", $VdfPath.Directory) | Set-Content $VdfPath

# Clean up.  
# This script can't be re-used since the $ProjectDir$ translates to an absolute path and therefore
# subsequent runs won't do the replacement.
del $PSCommandPath

