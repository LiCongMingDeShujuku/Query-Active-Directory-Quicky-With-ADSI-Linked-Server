![CLEVER DATA GIT REPO](https://raw.githubusercontent.com/LiCongMingDeShujuku/git-resources/master/0-clever-data-github.png "李聪明的数据库")

# 使用ADSI链接服务器快速查询Active Directory
#### Query Active Directory Quicky With ADSI Linked Server

![#](images/Query-Active-Directory-Quicky-With-ADSI-Linked-Server-01.png?raw=true "#")

## Contents

- [中文](#中文)
- [English](#English)
- [SQL Logic](#Logic)
- [Build Info](#Build-Info)
- [Author](#Author)
- [License](#License) 


## 中文
当你想要确保SQL安全性达到最佳状态时，最好使用添加到SQL Server的Active Directory和交叉引用帐户或组来查询。一种方法是给Active Directory创建链接服务器并运行简单的选择查询。下面是一些可以帮助你入门的SQL逻辑（logic）。 请记住，如果需要，你可以直接查询OU，组和用户。


## English
Whenever you want to make sure your SQL Security is up to scratch it’s a good idea to query Active Directory and cross reference accounts or groups with those added to SQL Server. One way to do this is by creating a linked server to Active Directory and running a simple select query.

Below is a some SQL Logic to get you started. Remember you can query OUs, Groups, and Users directly if needed.

---
## Logic
```SQL
use master;
set nocount on
 
-- Create ADSI Linked Server for Active Directory queries
exec master.dbo.sp_addlinkedserver 
    @server     = N'ADSI_LINK'
,   @srvproduct = N'Active Directory Services Interfaces'
,   @provider   = N'ADSDSOObject'
,   @datasrc    = N'MyDomainController.domain.com'
go
exec master.dbo.sp_addlinkedsrvlogin 
    @rmtsrvname = N'ADSI_LINK'
,   @useself    = N'False'
,   @locallogin = NULL
,   @rmtuser    = N'MyDomain\MyUserName'
,   @rmtpassword    = 'MyPassword'
go
 
select * from openquery
(
    ADSI_LINK
,   'SELECT mail
    ,   displayname FROM ''LDAP://MyDomainController.MyDomain.Com''
    WHERE 
        objectCategory  = ''Person'' 
        AND objectClass = ''user''

```

[![WorksEveryTime](https://forthebadge.com/images/badges/60-percent-of-the-time-works-every-time.svg)](https://shitday.de/)

## Build-Info

| Build Quality | Build History |
|--|--|
|<table><tr><td>[![Build-Status](https://ci.appveyor.com/api/projects/status/pjxh5g91jpbh7t84?svg?style=flat-square)](#)</td></tr><tr><td>[![Coverage](https://coveralls.io/repos/github/tygerbytes/ResourceFitness/badge.svg?style=flat-square)](#)</td></tr><tr><td>[![Nuget](https://img.shields.io/nuget/v/TW.Resfit.Core.svg?style=flat-square)](#)</td></tr></table>|<table><tr><td>[![Build history](https://buildstats.info/appveyor/chart/tygerbytes/resourcefitness)](#)</td></tr></table>|

## Author

- **李聪明的数据库 Lee's Clever Data**
- **Mike的数据库宝典 Mikes Database Collection**
- **李聪明的数据库** "Lee Songming"

[![Gist](https://img.shields.io/badge/Gist-李聪明的数据库-<COLOR>.svg)](https://gist.github.com/congmingshuju)
[![Twitter](https://img.shields.io/badge/Twitter-mike的数据库宝典-<COLOR>.svg)](https://twitter.com/mikesdatawork?lang=en)
[![Wordpress](https://img.shields.io/badge/Wordpress-mike的数据库宝典-<COLOR>.svg)](https://mikesdatawork.wordpress.com/)

---
## License
[![LicenseCCSA](https://img.shields.io/badge/License-CreativeCommonsSA-<COLOR>.svg)](https://creativecommons.org/share-your-work/licensing-types-examples/)

![Lee Songming](https://raw.githubusercontent.com/LiCongMingDeShujuku/git-resources/master/1-clever-data-github.png "李聪明的数据库")

