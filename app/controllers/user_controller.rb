require './helpers/utility'
class UserController < ApplicationController

  def index
    @sys_user = SysUser.select('sysuser_id', 'sys_role.sysrole_kode',
                               'sys_role.sysrole_nama', 'sysuser_nama',
                               'sysuser_namalengkap', 'sysuser_email')
                    .joins('INNER JOIN sys_role ON sys_role.sysrole_kode=sys_user.sysrole_kode')
    if @sys_user
      give_response('00', 'GET USER SUKSES', @sys_user)
    else
      give_response('00', 'GET USER GAGAL', @sys_user)
    end
  end

  def create
    sysuser_id = params[:sysuser_id]
    sysrole_kode = params[:sysrole_kode]
    sysuser_nama = params[:sysuser_nama]
    sysuser_passw = params[:sysuser_passw]
    sysuser_namalengkap = params[:sysuser_namalengkap]
    sysuser_email = params[:sysuser_email]
    @sys_user = SysUser.create(sysuser_id: sysuser_id,
                               sysrole_kode: sysrole_kode,
                               sysuser_nama: sysuser_nama,
                               sysuser_passw: sysuser_passw,
                               sysuser_namalengkap: sysuser_namalengkap,
                               sysuser_email: sysuser_email)
    if @sys_user
      give_response("00", "INSERT USER SUKSES", @sys_user)
    else
      give_response("01", "INSERT USER GAGAL")
    end
  end

  def update
    sysrole_kode = params[:sysrole_kode]
    sysuser_nama = params[:sysuser_nama]
    sysuser_namalengkap = params[:sysuser_namalengkap]
    sysuser_email = params[:sysuser_email]
    @sys_user = SysUser.find_by(sysuser_id: params[:sysuser_id])
    @sys_user.update(sysrole_kode: sysrole_kode, sysuser_nama: sysuser_nama,
                     sysuser_namalengkap: sysuser_namalengkap, sysuser_email: sysuser_email)
    give_response("00", "UPDATE USER SUKSES")
  end

  def delete
    @sys_user = User.find_by(sysuser_id: params[:sysuser_id])
    @sys_user.destroy
    give_response("00", "HAPUS USER SUKSES")
  end

end
