# frozen_string_literal: true

require './helpers/utility'
require './helpers/query_utils'
class AuthController < ApplicationController
  def verify_login
    sysuser_nama = params[:sysuser_nama]
    sysuser_passw = create_hash(params[:sysuser_passw])
    count_str = SysUser.where('sysuser_nama = ? AND sysuser_passw= ?', sysuser_nama, sysuser_passw).select('COUNT(*) AS total')
    count = count_str.first.total
    if count == 1
      @result = get_info_user(sysuser_nama, sysuser_passw)
      give_response('00', 'LOGIN SUKSES', @result)
    else
      give_response('01', 'LOGIN GAGAL')
    end
  end

  def change_password
    sysuser_id = params[:sysuser_id]
    old_password_from_data = get_old_password(sysuser_id)
    password_lama = create_hash(params[:password_lama])
    password_baru = create_hash(params[:password_baru])
    if password_lama == old_password_from_data
      @sys_user = SysUser.find_by(sysuser_id: params[:sysuser_id])
      @sys_user.update(sysuser_passw: password_baru)
      give_response('00', 'GANTI PASSWORD SUKSES')
    else
      give_response('01', 'PASSWORD LAMA TIDAK SAMA')
    end
  end
end
