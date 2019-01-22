# frozen_string_literal: true

def get_info_user(sysuser_nama, sysuser_passw)
  @result = SysUser.select('sysuser_id', 'sys_role.sysrole_kode',
                           'sys_role.sysrole_nama', 'sysuser_nama',
                           'sysuser_namalengkap', 'sysuser_email')
                   .joins('INNER JOIN sys_role ON sys_role.sysrole_kode=sys_user.sysrole_kode')
                   .where('sysuser_nama= ? AND sysuser_passw = ?', sysuser_nama, sysuser_passw)
end

# noinspection RubyResolve
def get_old_password(sysuser_id)
  query = SysUser.select('sysuser_passw').where('sysuser_id= ? ', sysuser_id)
  @result = query.first.sysuser_passw
end

def create_log(response, status)
  uri = request.original_url
  method = request.method
  params = request.POST
  ip_address = request.remote_ip
  request_time = Time.now
  @logservice = Logservice.create(uri: uri, method: method, params: params.to_json,
                                  ip_address: ip_address, request_time: request_time,
                                  response: response, status: status)
end
