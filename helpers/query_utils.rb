def get_info_user(sysuser_nama, sysuser_passw)
  @result = SysUser.select('sysuser_id', 'sys_role.sysrole_kode',
                           'sys_role.sysrole_nama', 'sysuser_nama',
                           'sysuser_namalengkap', 'sysuser_email')
                .joins('INNER JOIN sys_role ON sys_role.sysrole_kode=sys_user.sysrole_kode')
                .where("sysuser_nama= ? AND sysuser_passw = ?", sysuser_nama, sysuser_passw)
end