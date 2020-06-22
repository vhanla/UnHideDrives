UnHideDrives
------------
![snap01](https://raw.githubusercontent.com/vhanla/UnHideDrives/master/.gitassets/snap01.png)

This simple tool for Windows will help you to hide drives (letters) 

## How does it work?

UnHideDrives basically works by editing a Windows registry entry at:
`HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer`

The value to modify or create if it doesn't exist is `NoDrives` (DWORD value), that even Windows XP
takes into consideration in order to show or not show, some drive letters.

**Notice** that **it will only hide it**, it **won't make it unaccessible**, and only Windows File Explorer
is involved. You can even access hidden drive letters by writing it in the path edit box.

Its value is modified bitwise, and each bit set hides the corresponding drive letter
as shown in the table below, the order is from A-Z in reverse, being the first bit drive A:
e.g. in the following table I'm hiding the drive D:
|Z|Y|X|W|V|U|T|S|R|Q|P|O|N|M|L|K|J|I|H|G|F|E|D|C|B|A|
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|**1**|0|0|0|

However, those changes won't be applied immediately, `explorer.exe` (Windows File Explorer) needs
to be restarted.

**Limitations:** Even though this registry belongs to the current user, it won't be modified from third party
tools as long as it is not evelated, so that's why the tool requires admin privileges.

## How to use:
Just launch the tool (is portable, a.k.a. no need to install), and pick those drive letters
you don't like to be (easily) visible in Explorer (Win+E), then **Save Changes** and finally
 **Restart Windows Explorer**. If you want to restore the already opened paths opened
in the File Explorer, keep the checked the `Restore current opened Explorer windows`, otherwise
uncheck it, and Windows File Explorer will restart without reopening those paths.

## Download:

Get it from [releases page](https://github.com/vhanla/UnHideDrives/releases).
