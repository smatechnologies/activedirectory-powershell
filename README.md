# Active Directory with Powershell
This script contains several simple examples of how to manage Active Directory with Powershell.

# Prerequisites
* Powershell 5.1
* <a href url="https://docs.microsoft.com/en-us/powershell/module/activedirectory/?view=winserver2012-ps&viewFallbackFrom=win10-ps">Active Directory</a> cmdlets installed on the pc/server

# Instructions
This script contains several parameters depending on the option:
* <b>adName</b> - Login name for the active directory account
* <b>email</b> - Email address associated with the active directory account
* <b>name</b> - First and last name
* <b>title</b> - Title of the account
* <b>oldpw</b> - Used when supplying current password for resets (could be used as a means of MFA)
* <b>pw</b> - New password for resetting accounts
* <b>option</b> - new/unlock/reset

Execution example: <br>
```
powershell.exe -ExecutionPolicy Bypass -File Active_Directory_Examples.ps1 -option "unlock" -adname "jsmith" 
```

# Disclaimer
No Support and No Warranty are provided by SMA Technologies for this project and related material. The use of this project's files is on your own risk.

SMA Technologies assumes no liability for damage caused by the usage of any of the files offered here via this Github repository.

# License
Copyright 2020 SMA Technologies

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# Contributing
We love contributions, please read our [Contribution Guide](CONTRIBUTING.md) to get started!

# Code of Conduct
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](code-of-conduct.md)
SMA Technologies has adopted the [Contributor Covenant](CODE_OF_CONDUCT.md) as its Code of Conduct, and we expect project participants to adhere to it. Please read the [full text](CODE_OF_CONDUCT.md) so that you can understand what actions will and will not be tolerated.
