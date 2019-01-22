require './helpers/utility'
require './helpers/query_utils'
class AuthController < ApplicationController

  def verify_login
    sysuser_nama = params[:sysuser_nama]
    sysuser_passw = create_hash(params[:sysuser_passw])
    count_str = SysUser.where("sysuser_nama = ? AND sysuser_passw= ?", sysuser_nama, sysuser_passw).select("COUNT(*) AS total")
    count = count_str.first.total
    if count == 1
      @result = get_info_user(sysuser_nama, sysuser_passw)
      give_response("00", "LOGIN SUKSES", @result)
    else
      give_response("01", "LOGIN GAGAL")
    end
  end

  def change_password

  end

end
