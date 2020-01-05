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
